//meta2
import processing.opengl.*;
//luz ambiente
int instrucoes;
boolean instrucoesA=true;
int amb_r;
int amb_g;
int amb_b;
boolean ligar=false;
int interruptor=0;

//foco
float red []= {255,200,150,100,50,0};
float green []={255,200,150,100,50,0};
float blue []={255,200,150,100,50,0};
int r;
int g;
int b;

float loc_x=0;
float loc_y=0;
float loc_z=1500;
float angle=PI/2;
float conc=0.5;
 boolean foco=true;
 int inter_foco=0;

//pontual
int red_pontual=0;
int green_pontual=0;
int blue_pontual=0;
boolean material=false;
int conta_material;


PImage texturas;
PImage mosaico;
PImage azulejo;
float angVisao=PI/3;
float tamanho=200;
float Distancia;

//meta1
//baseado em codigo dado para/feito na aula--> teve esse codigo como base
float centroX=400;
float centroY=400;
float centroCadeiraX=centroX;
float centroCadeiraY=centroY;

 float X=PI/360;
  float X1=PI/360;
 int velocidade=10;
 float velocidadeMax= centroCadeiraX +1200;
 float velocidadeMin=centroX;
 
 
float poX=1400;
float poY= 200;
float poZ= 400;


float rotacao=PI/360;

Boolean Z1=false;
Boolean Z=false;

float rotacaoZ;
float rotacaoMaxima=rotacao+PI/4;
float rotacaoMin=rotacao-PI/4;
float rotacao3;

float andar1=1;
float andar2=1;
boolean andarDireita=false;
boolean andarEsquerda=false;
//explicações;

String teclaZ1;
String teclaZ;
String Andar;
String Parar;
String interruptorLuz;

String rodarZ1;
String rodarZ;
String rodarZ1Texto;
String rodarZTexto;
String ligarLuz;
String focos;

String aviso_luzes;

//=========================================== INICIALIZACOES
void setup() 
{
  size(800, 800, P3D);
  frameRate(20);
  
  //meta2
  smooth();
  noStroke();
  //transparencia
  hint(ENABLE_DEPTH_SORT);
  
  //texturas
  textureMode(NORMAL);
  textureWrap(REPEAT);
  texturas= loadImage("madeira.bmp");
  mosaico=loadImage("madeira_chao.jpg");
  azulejo=loadImage("parede.jpg");
  


  
}


//========================================================
void desenhaEixos(){
 
 stroke(255,0,0);
 line(0,0,0,  2000,0,0);    // x Vermelho
 stroke(0,255,0);
 line(0,0,0,  0,300,0);    // y Verde
 stroke(0,0,255);
 line(0,0,0,  0,0,300);    // z azul 
 noStroke();
}
//materiais
void PlasticoPreto(){
colorMode(RGB, 1, 1, 1);
ambient(0.0,0.0,0.0);
fill(0,01,0.01,0.01);
specular(0.50,0.50,0.50);
shininess(0.25*128);
}
void Turquoise(){
  colorMode(RGB, 1, 1, 1);
ambient(0.1,0.18725,0.1745);
fill(0.396,0.74151,0.69192);
specular(0.297254,0.30829,0.306678);
shininess(0.1*128);
}
void Cobre(){
   colorMode(RGB, 1, 1, 1);
ambient(0.19125,0.0735,0.0225);
fill(0.7038,0.27048,0.0828);
specular(0.256777,0.137622,0.086014);
shininess(0.1*128);
  
}
void Mesa(float d, PImage textura_3){
  
 float d2= d*2;
 float d3=d2-d/40;
 float d4= d2-20;
  textureWrap(REPEAT);
  noStroke();
  
   translate(0,d+d/2+d/3);
  ambient(183,193,221);
 fill(183, 193, 221,50);
  specular(red[r], green[g], blue[b]);
  shininess(250);
   beginShape(QUADS);
     vertex( -d2,  -d2, d2-d/2);
     vertex(  d2,  -d2, d2-d/2);
     vertex(  d2,   d2, d2-d/2);
     vertex( -d2,   d2, d2-d/2);
  endShape();
  
    ambient(183,193,221);
 fill(183, 193, 221,50);
  specular(red[r], green[g], blue[b]);
  shininess(250);
  beginShape(QUADS);
 
     vertex( -d2,d2,d3-d/2 );
     vertex(  d2,d2, d3-d/2 );
     vertex(  d2,d2, d2-d/2);
     vertex( -d2,d2, d2-d/2 );
  endShape();
  
  ambient(183,193,221);
     fill(183, 193, 221,50);
  specular(red[r], green[g], blue[b]);
  shininess(250);
  
    beginShape(QUADS);
   
     vertex(-d2,-d2,d3-d/2);
     vertex( d2,-d2,d3-d/2);
     vertex( d2,-d2,d2-d/2);
     vertex( -d2,-d2,d2-d/2);
  endShape();

   ambient(183,193,221);
     fill(183, 193, 221,50);
  specular(red[r], green[g], blue[b]);
  shininess(250);
  
    beginShape(QUADS);
    
     vertex(d2,-d2,d3-d/2);
     vertex( d2,d2,d3-d/2);
     vertex( d2,d2,d2-d/2);
     vertex( d2,-d2,d2-d/2);
  endShape();
  
    ambient(183,193,221);
     fill(183, 193, 221,50);
  specular(red[r], green[g], blue[b]);
  shininess(250);
  
    beginShape(QUADS);
     vertex(-d2,-d2,d3-d/2);
     vertex( -d2,d2,d3-d/2);
     vertex( -d2,d2,d2-d/2);
     vertex( -d2,-d2,d2-d/2);
  endShape();
  
  
  //base-fundo
   
  
    ambient(183,193,221);
    fill(183, 193, 221,50);
specular(red[r], green[g], blue[b]);
  shininess(250);
 beginShape(QUADS);

     vertex( -d2,  -d2, d3-d/2);
     vertex(  d2,  -d2, d3-d/2);
     vertex(  d2,   d2, d3-d/2);
     vertex( -d2,   d2, d3-d/2);
  endShape();
  
  
  pushStyle();
  PlasticoPreto();
  // perna 1

 //vistaA
 
  beginShape(QUADS);
  texture(textura_3);
     vertex( -d2,  d2, -d2,0,1 );
     vertex(  -d4,  d2, -d2,1,1 );
     vertex(  -d4,   d2, d3-d/2,1,0 );
     vertex( -d2,   d2, d3-d/2,0,0 );
  endShape();
  
  //vistaB
  
  beginShape(QUADS);
  texture(textura_3);
     vertex( -d2,  d4, -d2,0,1 );
     vertex(  -d2,  d2, -d2,1,1);
     vertex(  -d2,   d2, d3-d/2,1,0 );
     vertex( -d2,   d4, d3-d/2,0 ,0 );
  endShape();
  
  //vistaC
  
  beginShape(QUADS);
  texture(textura_3);
     vertex( -d2,  d4, -d2,0,1 );
     vertex(  -d4,  d4, -d2,1,1 );
     vertex(  -d4,   d4, d3-d/2 ,1,0);
     vertex( -d2,   d4, d3-d/2,0,0 );
  endShape();
  
  //vistaD
  
  beginShape(QUADS);
  texture(textura_3);
     vertex( -d4,  d4, -d2, 0,1);
     vertex(  -d4,  d2, -d2,1,1 );
     vertex(  -d4,   d2, d3-d/2,1,0 );
     vertex( -d4,   d4, d3-d/2,0,0 );
  endShape();
  
  // perna 2
  //vistaA
 
  beginShape(QUADS);
  texture(textura_3);
     vertex( d4,  d2, -d2,0,1 );
     vertex(  d2,  d2, -d2,1,1 );
     vertex(  d2,   d2, d3-d/2,1,0 );
     vertex( d4,   d2, d3-d/2,0,0 );
  endShape();
  
  //vistaB
  
  beginShape(QUADS);
  texture(textura_3);
     vertex( d4,  d4, -d2,0,1 );
     vertex(  d4,  d2, -d2,1,1 );
     vertex(  d4,   d2, d3-d/2,1,0 );
     vertex( d4,   d4, d3-d/2,0,0 );
  endShape();
  
  //vistaC
  
  beginShape(QUADS);
  texture(textura_3);
     vertex( d4,  d4, -d2,0,1 );
     vertex(  d2,  d4, -d2,1,1 );
     vertex(  d2,   d4, d3-d/2,1,0 );
     vertex( d4,   d4, d3-d/2,0,0 );
  endShape();
  
  //vistaD
  
  beginShape(QUADS);
  texture(textura_3);
     vertex( d2,  d4, -d2,0,1 );
     vertex(  d2,  d2, -d2,1,1 );
     vertex(  d2,   d2, d3-d/2,1,0 );
     vertex( d2,   d4, d3-d/2,0,0 );
  endShape();
  
  // perna3
  
  //vistaA
  
  beginShape(QUADS);
  texture(textura_3);
     vertex( -d2,  -d2, -d2,0,1 );
     vertex(  -d4,  -d2, -d2,1,1 );
     vertex(  -d4,   -d2, d3-d/2,1,0 );
     vertex( -d2,   -d2, d3-d/2,0,0 );
  endShape();
  
  //vistaB

  beginShape(QUADS);
  texture(textura_3);
     vertex( -d2,  -d4, -d2,0,1 );
     vertex(  -d2,  -d2, -d2,1,1 );
     vertex(  -d2,   -d2, d3-d/2,1,0 );
     vertex( -d2,   -d4, d3-d/2,0,0 );
  endShape();
  
  
  beginShape(QUADS);
   texture(textura_3);
         vertex( -d2,  -d4, -d2,0,1 );
     vertex(  -d4,  -d4, -d2,1,1 );
     vertex(  -d4,   -d4, d3-d/2,1,0 );
     vertex( -d2,   -d4, d3-d/2,0,0 );
  endShape();
  
  //vistaD
  
  beginShape(QUADS);
  texture(textura_3);
         vertex( -d4,  -d4, -d2,0,1 );
     vertex(  -d4,  -d2, -d2,1,1 );
     vertex(  -d4,   -d2, d3-d/2,1,0 );
     vertex( -d4,   -d4, d3-d/2,0,0 );
  endShape();
  
  // perna4
  
  //vistaA
     
  beginShape(QUADS);
  texture(textura_3);
     vertex( d4,  -d2, -d2,0,1 );
     vertex(  d2,  -d2, -d2,1,1 );
     vertex(  d2,   -d2, d3-d/2,1,0 );
     vertex( d4,   -d2, d3-d/2,0,0 );
  endShape();
  
  //vistaB
       
  beginShape(QUADS);
  texture(textura_3);
     vertex( d4,  -d4, -d2,0,1 );
     vertex(  d4,  -d2, -d2,1,1 );
     vertex(  d4,   -d2, d3-d/2,1,0 );
     vertex( d4,   -d4, d3-d/2,0,0 );
  endShape();
  
  //vistaC
   
  beginShape(QUADS);
  texture(textura_3);
     vertex( d4,  -d4, -d2,0,1 );
     vertex(  d2,  -d4, -d2,1,1 );
     vertex(  d2,   -d4, d3-d/2,1,0 );
     vertex( d4,   -d4, d3-d/2,0,0 );
  endShape();
  
    //vistaD
   
  beginShape(QUADS);
  texture(textura_3);
     vertex( d2,  -d4, -d2,0,1 );
     vertex(  d2,  -d2, -d2,1,1 );
     vertex(  d2,   -d2, d3-d/2,1,0 );
     vertex( d2,   -d4, d3-d/2,0,0 );
  endShape();
  popStyle();

  
}





void desenhaCadeira(float  d, PImage textura){
  float d2= d/2;
  float d3= d2+20;
  float d4= d2-20;
  textureWrap(REPEAT);
   noStroke();
  //base-topo
 pushStyle();
 PlasticoPreto();
  beginShape(QUADS);
  texture(textura);
     vertex( -d2,  -d2, d2,0 ,0);
     vertex(  d2,  -d2, d2,0,1 );
     vertex(  d2,   d2, d2,1,1 );
     vertex( -d2,   d2, d2,1,0 );
  endShape();
  
  //costas
  
  //partes maiores
  //A

    beginShape(QUADS);
    texture(textura);
     vertex(-d2,-d2,d*2,0,1 );
     vertex( d2,-d2,d*2,1,1 );
     vertex( d2,-d2,d2,1,0 );
     vertex( -d2,-d2,d2,0,0 );
  endShape();
//B

    beginShape(QUADS);
    texture(textura);
     vertex(-d2,-d2+20,d*2,0,1 );
     vertex( d2,-d2+20,d*2,1,1 );
     vertex( d2,-d2+20,d2,1,0 );
     vertex( -d2,-d2+20,d2,0,0 );
  endShape();
  
  //partes menores
  //C-cima

    beginShape(QUADS);
    texture(textura);
     vertex(d2,-d2,d*2 ,0,0);
     vertex( d2,-d2+20,d*2,0,1 );
     vertex( -d2,-d2+20,d*2,1,1);
     vertex( -d2,-d2,d*2,1,0 );
  endShape();
  //lados;
  //D
   
    beginShape(QUADS);
    texture(textura);
     vertex(d2,-d2,d2 ,0,1);
     vertex( d2,-d2+20,d2,1,1 );
     vertex( d2,-d2+20,d*2,1,0);
     vertex( d2,-d2,d*2,0,0 );
  endShape();
  
  //E
    
    beginShape(QUADS);
    texture(textura);
     vertex(-d2,-d2,d2,0,1 );
     vertex( -d2,-d2+20,d2,1,1 );
     vertex( -d2,-d2+20,d*2,1,0);
     vertex( -d2,-d2,d*2,0,0 );
  endShape();
  
  //base-lados
  
    beginShape(QUADS);
    texture(textura);
     vertex( -d2,d2,d3,0,1 );
     vertex(  d2,d2, d3,1,1 );
     vertex(  d2,d2, d2,1,0);
     vertex( -d2,d2, d2,0,0 );
  endShape();
  

    beginShape(QUADS);
    texture(textura);
     vertex(-d2,-d2,d3,0,1);
     vertex( d2,-d2,d3,1,1 );
     vertex( d2,-d2,d2,1,0 );
     vertex( -d2,-d2,d2,0,0 );
  endShape();

  
    beginShape(QUADS);
    texture(textura);
     vertex(d2,-d2,d3,0,1 );
     vertex( d2,d2,d3,1,1 );
     vertex( d2,d2,d2,1,0 );
     vertex( d2,-d2,d2,0,0 );
  endShape();
  
    
    beginShape(QUADS);
    texture(textura);
     vertex(-d2,-d2,d3,0,1 );
     vertex( -d2,d2,d3,1,1 );
     vertex( -d2,d2,d2,1,0 );
     vertex( -d2,-d2,d2,0,0 );
  endShape();
  //base-fundo
   
  beginShape(QUADS);
  texture(textura);
     vertex( -d2,  -d2, d3,0,0 );
     vertex(  d2,  -d2, d3,0,1 );
     vertex(  d2,   d2, d3,1,1 );
     vertex( -d2,   d2, d3,1,0 );
  endShape();
//pernas 

// perna 1

 //vistaA
 
  beginShape(QUADS);
  texture(textura);
     vertex( -d2,  d2, -d2*2,0,1 );
     vertex(  -d4,  d2, -d2*2,1,1 );
     vertex(  -d4,   d2, d3,1,0 );
     vertex( -d2,   d2, d3,0,0 );
  endShape();
  
  //vistaB
  
  beginShape(QUADS);
  texture(textura);
     vertex( -d2,  d4, -d2*2,0,1 );
     vertex(  -d2,  d2, -d2*2,1,1);
     vertex(  -d2,   d2, d3,1,0 );
     vertex( -d2,   d4, d3,0 ,0 );
  endShape();
  
  //vistaC
  
  beginShape(QUADS);
  texture(textura);
     vertex( -d2,  d4, -d2*2,0,1 );
     vertex(  -d4,  d4, -d2*2,1,1 );
     vertex(  -d4,   d4, d3 ,1,0);
     vertex( -d2,   d4, d3,0,0 );
  endShape();
  
  //vistaD
  
  beginShape(QUADS);
  texture(textura);
     vertex( -d4,  d4, -d2*2, 0,1);
     vertex(  -d4,  d2, -d2*2,1,1 );
     vertex(  -d4,   d2, d3,1,0 );
     vertex( -d4,   d4, d3,0,0 );
  endShape();
  
  // perna 2
  //vistaA
 
  beginShape(QUADS);
  texture(textura);
     vertex( d4,  d2, -d2*2,0,1 );
     vertex(  d2,  d2, -d2*2,1,1 );
     vertex(  d2,   d2, d3,1,0 );
     vertex( d4,   d2, d3,0,0 );
  endShape();
  
  //vistaB
  
  beginShape(QUADS);
  texture(textura);
     vertex( d4,  d4, -d2*2,0,1 );
     vertex(  d4,  d2, -d2*2,1,1 );
     vertex(  d4,   d2, d3,1,0 );
     vertex( d4,   d4, d3,0,0 );
  endShape();
  
  //vistaC
  
  beginShape(QUADS);
  texture(textura);
     vertex( d4,  d4, -d2*2,0,1 );
     vertex(  d2,  d4, -d2*2,1,1 );
     vertex(  d2,   d4, d3,1,0 );
     vertex( d4,   d4, d3,0,0 );
  endShape();
  
  //vistaD
  
  beginShape(QUADS);
  texture(textura);
     vertex( d2,  d4, -d2*2,0,1 );
     vertex(  d2,  d2, -d2*2,1,1 );
     vertex(  d2,   d2, d3,1,0 );
     vertex( d2,   d4, d3,0,0 );
  endShape();
  
  // perna3
  
  //vistaA
  
  beginShape(QUADS);
  texture(textura);
     vertex( -d2,  -d2, -d2*2,0,1 );
     vertex(  -d4,  -d2, -d2*2,1,1 );
     vertex(  -d4,   -d2, d3,1,0 );
     vertex( -d2,   -d2, d3,0,0 );
  endShape();
  
  //vistaB

  beginShape(QUADS);
  texture(textura);
     vertex( -d2,  -d4, -d2*2,0,1 );
     vertex(  -d2,  -d2, -d2*2,1,1 );
     vertex(  -d2,   -d2, d3,1,0 );
     vertex( -d2,   -d4, d3,0,0 );
  endShape();
  
  
  beginShape(QUADS);
   texture(textura);
         vertex( -d2,  -d4, -d2*2,0,1 );
     vertex(  -d4,  -d4, -d2*2,1,1 );
     vertex(  -d4,   -d4, d3,1,0 );
     vertex( -d2,   -d4, d3,0,0 );
  endShape();
  
  //vistaD
  
  beginShape(QUADS);
  texture(textura);
         vertex( -d4,  -d4, -d2*2,0,1 );
     vertex(  -d4,  -d2, -d2*2,1,1 );
     vertex(  -d4,   -d2, d3,1,0 );
     vertex( -d4,   -d4, d3,0,0 );
  endShape();
  
  // perna4
  
  //vistaA
     
  beginShape(QUADS);
  texture(textura);
     vertex( d4,  -d2, -d2*2,0,1 );
     vertex(  d2,  -d2, -d2*2,1,1 );
     vertex(  d2,   -d2, d3,1,0 );
     vertex( d4,   -d2, d3,0,0 );
  endShape();
  
  //vistaB
       
  beginShape(QUADS);
  texture(textura);
     vertex( d4,  -d4, -d2*2,0,1 );
     vertex(  d4,  -d2, -d2*2,1,1 );
     vertex(  d4,   -d2, d3,1,0 );
     vertex( d4,   -d4, d3,0,0 );
  endShape();
  
  //vistaC
   
  beginShape(QUADS);
  texture(textura);
     vertex( d4,  -d4, -d2*2,0,1 );
     vertex(  d2,  -d4, -d2*2,1,1 );
     vertex(  d2,   -d4, d3,1,0 );
     vertex( d4,   -d4, d3,0,0 );
  endShape();
  
    //vistaD
   
  beginShape(QUADS);
  texture(textura);
     vertex( d2,  -d4, -d2*2,0,1 );
     vertex(  d2,  -d2, -d2*2,1,1 );
     vertex(  d2,   -d2, d3,1,0 );
     vertex( d2,   -d4, d3,0,0 );
  endShape();
  
  //horizontais das pernas
  
  //horizontal1
  //A
  
  beginShape(QUADS);
  texture(textura);
     vertex( -d4,  d2, -d2,0,0 );
     vertex(  d4,  d2, -d2,0,1);
     vertex(  d4, d4, -d2,1,1 );
     vertex( -d4, d4, -d2,1,0 );
  endShape();
  
  //B
    
  beginShape(QUADS);
  texture(textura);
     vertex( -d4,  d2, -d2+20,0,1 );
     vertex(  d4,  d2, -d2+20,1,1);
     vertex(  d4, d2, -d2,1,0 );
     vertex( -d4, d2, -d2,0,0 );
  endShape();
  
  //C
   
  beginShape(QUADS);
  texture(textura);
     vertex( -d4,  d2, -d2+20,0,0 );
     vertex(  d4,  d2, -d2+20,0,1);
     vertex(  d4, d4, -d2+20 ,1,1);
     vertex( -d4, d4, -d2+20 ,1,0);
  endShape();
  
  //D
     
  beginShape(QUADS);
  texture(textura);
     vertex( -d4,  d4, -d2+20,0,1 );
     vertex(  d4,  d4, -d2+20,1,1);
     vertex(  d4, d4, -d2,1,0 );
     vertex( -d4, d4, -d2,0,0 );
  endShape();
  popStyle();
  
}

void chao(float d, float d1, PImage textura_1){
float n=9;
  textureWrap(REPEAT);
  beginShape(QUADS);
  texture(textura_1);
  vertex(d1*n,d1*n,-d,0,0);
  vertex(-d1*n,d1*n,-d,0,n);
  vertex(-d1*n,-d1*n,-d,n,n);
  vertex(d1*n,-d1*n,-d,n,0);
  endShape();
}
void paredes(float d,float d1, PImage textura_2){
  textureWrap(REPEAT);
  int num_r_altura=3;
  int num_r_largura=3;
  float m=9;
  pushStyle();
  if(material==false){
  Turquoise();
  println("Turquoise");
  }
  else if(material==true){
    Cobre();
    println("Cobre");
  }
  
  beginShape(QUADS);
  texture(textura_2);
  vertex(d1*m,d1*m,d*6,0,num_r_largura);
  vertex(-d1*m,d1*m,d*6,num_r_altura,num_r_largura);
  vertex(-d1*m,d1*m,-d,num_r_altura,0);
  vertex(d1*m,d1*m,-d,0,0);
  
  endShape();
  
   beginShape(QUADS);
  texture(textura_2);
  vertex(-d1*m,d1*m,d*6,0,num_r_largura);
  vertex(-d1*m,-d1*m,d*6,num_r_altura,num_r_largura);
  vertex(-d1*m,-d1*m,-d,num_r_altura,0);
  vertex(-d1*m,d1*m,-d,0,0);
  endShape();
  
   beginShape(QUADS);
  texture(textura_2);
  vertex(d1*m,-d1*m,d*6,0,num_r_largura);
  vertex(-d1*m,-d1*m,d*6,num_r_altura,num_r_largura);
  vertex(-d1*m,-d1*m,-d,num_r_altura,0);
  vertex(d1*m,-d1*m,-d,0,0);
  endShape();
  
   beginShape(QUADS);
  texture(textura_2);
   vertex(d1*m,d1*m,d*6,0,num_r_largura);
  vertex(d1*m,-d1*m,d*6,num_r_altura,num_r_largura);
  vertex(d1*m,-d1*m,-d,num_r_altura,0);
  vertex(d1*m,d1*m,-d,0,0);
  endShape();
  popStyle();
  
}


void draw() 
{
 background(0,0,0);
 pushMatrix();
 camera();//-->https://forum.processing.org/one/topic/simple-2d-text-on-top-of-opengl.html
 background(0,0,0);
 noStroke();
  fill(255,0,0);
  if(instrucoesA==true){
 teclaZ="pressione a tecla "+ rodarZ +" para "+ rodarZTexto + " o eixo dos Z para a esquerda";
 teclaZ1="pressione a tecla " + rodarZ1 +" para " + rodarZ1Texto + " o eixo dos Z para a direita";
 Andar="pressione > para andar para afastar, e < para aproximar";
 Parar="pressione espaço para terminar o movimento > e <";
 interruptorLuz="pressione a tecla O para "+ ligarLuz+ " a luz";
 String AumentarLuz="pressione na tecla 'UP' para aumentar a luz pontual";
 String DiminuirLuz="pressione na tecla 'DOWN' para diminuir a luz pontual";
 String RGBs="pressione nas 'R','B' e 'G' para mudar as cores dos focus de luz";
 String focoLigar="pressione em 'f' para " + focos + " os focos de luz";
 String focoConcentracao="pressione as teclas '+' e '-' para aumentar e dimunuir a concentração do foco";
 String instrucoesB="pressione a tecla 'A' para esconder as instruções";
 String Materiais="pressione a tecla 'M' para mudar o material da parede";
 textSize(20);
 text(instrucoesB,10, 560,0);
 textSize(15);
 text(Materiais,10, 580,0);
 text(focoConcentracao,10, 600,0);
 text(RGBs,10, 620,0);
 text(focoLigar,10, 640,0);  
 text(AumentarLuz,10, 660,0);
 text(DiminuirLuz,10, 680,0); 
 text(teclaZ1,10, 700,0);
 text(teclaZ,10, 720,0);
 text(Andar, 10, 740,0);
 text(Parar, 10, 760,0);
 text(interruptorLuz,10,780,0);
  }else{
    textSize(20);
    String instrucoesC="pressione a tecla 'A' para mostrar as instruções";
    text(instrucoesC, 10, 760,0);
  }
  

 popMatrix();
 
 camera( poX,poY,poZ,     centroCadeiraX, centroCadeiraY, 250,    0, 0,-1);
 
 //luz ambiente --> ligar/desligar
 if(ligar==true){
   amb_r=250;
   amb_g=250;
   amb_b=250;
   ligarLuz="desligar";
 }
 else{
   amb_r=50;
   amb_g=50;
   amb_b=50;
   ligarLuz="ligar";
 }
 

 
 
 
 pushMatrix();

//luz ambiente
ambientLight(amb_r,amb_g,amb_b);

 // luz Foco
if(foco==true){
spotLight(red[r],green[g],blue[b],centroX-100,centroY-400,loc_z,0,0,-1,angle/2,conc);
spotLight(red[r],green[g],blue[b],centroX-100,centroY+400,loc_z,0,0,-1,angle/2,conc);
focos="desligar";
}else{
  focos="ligar";
}
//Luz pontual
pointLight(red_pontual, green_pontual, blue_pontual, centroX, centroY, loc_z);

popMatrix();

//translacao;
 pushMatrix();
    translate(centroCadeiraX, centroCadeiraY, 100);
  if(andarDireita==true){
    if(centroCadeiraX< velocidadeMax){
      
    centroCadeiraX=centroCadeiraX+velocidade;
    }
    else{
   centroCadeiraX=velocidadeMax;
    }
    
     
      

  }
  if(andarEsquerda==true){
    if(centroCadeiraX>velocidadeMin){
      centroCadeiraX=centroCadeiraX-velocidade;
    }
    else{
      centroCadeiraX=velocidadeMin;
    }
      
   
    
      
  }
  

//rodar cadeira ladoA
   if(Z==true ){
     if(rotacao3<rotacaoMaxima){
         rotacao3=rotacao3 + X;
         rodarZ="3";
         rodarZTexto="parar";
       }
         else{
           rotacao3=rotacaoMaxima;
           rodarZ1="2";
           rodarZ1Texto="rodar";
         }
         
  }
  else{ 
 rodarZ="1";
 rodarZTexto="rodar";
  }
  
  
  //rodar cadeira ladoB
  if(Z1==true ){
    if(rotacao3>rotacaoMin){
         rotacao3=rotacao3 - X;
         rodarZ1="4";
         rodarZ1Texto="parar";
       }
         else{
         rotacao3=rotacaoMin;
           rodarZ="1";
           rodarZTexto="rodar";
         }
         
  }
  else{ 
 rodarZ1="2";
 rodarZ1Texto="rodar";
  }
    rotateZ(PI/2);
    rotateZ(rotacao3);
   
    
  desenhaCadeira(200, texturas); 
  popMatrix();
  Mesa(200,texturas);
  chao(200,tamanho, mosaico);
  paredes(200,tamanho,azulejo);
  
 
 
}

void keyPressed( ){
 

    
   
  if (key=='1' || key=='1'){
   
    Z=true;
    Z1=false;
    rotacaoZ=rotacao3;
  }
   if (key=='2' || key=='2'){
    
    Z1=true;
    Z=false;
    rotacaoZ=rotacao3;
  }
  if (key=='3' || key=='3'){
   
    Z=false;
 
    rotacaoZ=rotacao3;
  }
   if (key=='4' || key=='4'){
    
    Z1=false;
    rotacaoZ=rotacao3;
  }
    
    if(keyCode==LEFT){
      andar1++;
      tamanho++;
      if(andar1%2==0){
         if(andarEsquerda==true){
          andarEsquerda=false;
          andar2++;
          
        }
      andarDireita=true;
      
      }
      else{
        andarDireita=false;
      }
    }
     
    else if(keyCode==RIGHT){
      andar2++;
      
      println(tamanho);
      if(andar2%2==0){
        if(andarDireita==true){
          andarDireita=false;
          andar1++;
          
        }
      andarEsquerda=true;
      }
      else{
        andarEsquerda=false;
      }
    }
    else if(key==' '){
      if(andarDireita==true){
          andarDireita=false;
          andar1++;
        }
    if(andarEsquerda==true){
          andarEsquerda=false;
          andar2++;
        }
  
    }
    if(key=='o'||key=='O'){
     
      interruptor++;
      if(interruptor%2!=0){
      ligar=true;
      
    }else
  { ligar=false;
}
      
     
    
    }
    if(key=='r'||key=='R'){
      r=round(random(0,5));
      println(r);
      println(red[r]);
    }
     if(key=='g'||key=='G'){
      g=round(random(0,5));
      println(g);
      
    }
     if(key=='b'||key=='B'){
      b=round(random(0,5));
      println(b);
    }
    if(key=='+'){
      conc=conc+0.1;
      
      println(conc);
    }
    if(key=='-'){
      conc=conc-0.1;
      if(conc<=0.1){
        conc=0.1;}
        
      println(conc);
    }
    if(key=='f'|| key=='F'){
      inter_foco++;
      if(inter_foco%2==0){
      foco=true;
      
    }else
  { foco=false;
}
    }
    if(keyCode==UP){
      red_pontual++;
      green_pontual++;
      blue_pontual++;
      println("red: "+red_pontual+", green: "+ green_pontual+", blue: "+ blue_pontual);
    }
    if(keyCode==DOWN){
      red_pontual--;
      green_pontual--;
      blue_pontual--;
      println("red: "+red_pontual+", green: "+ green_pontual+", blue: "+ blue_pontual);
    }
    if(key=='m' || key=='M'){
      conta_material++;
      if(conta_material%2==0){
        material=false;
      }
      else{
        material=true;
      }
    }
    if(key=='a' || key=='A'){
      instrucoes++;
      if(instrucoes%2==0){
        instrucoesA=false;
        
      }
      else{
        instrucoesA=true;
      }
      
    }

}
