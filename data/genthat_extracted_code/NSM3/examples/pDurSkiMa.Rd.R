library(NSM3)


### Name: pDurSkiMa
### Title: Durbin, Skillings-Mack
### Aliases: pDurSkiMa
### Keywords: Durbin Skillings-Mack

### ** Examples

##Hollander, Wolfe, Chicken Example 7.6 Chemical Toxicity
table7.12<-matrix(nrow=7,ncol=7)
table7.12[1,c(1,2,4)]<-c(0.465,0.343,0.396)
table7.12[2,c(1,3,5)]<-c(0.602,0.873,0.634)
table7.12[3,c(3,4,7)]<-c(0.875,0.325,0.330)
table7.12[4,c(1,6,7)]<-c(0.423,0.987,0.426)
table7.12[5,c(2,3,6)]<-c(0.652,1.142,0.989)
table7.12[6,c(2,5,7)]<-c(0.536,0.409,0.309)
table7.12[7,c(4,5,6)]<-c(0.609,0.417,0.931)

pDurSkiMa(table7.12)

##or, equivalently:
x<-c(.465,.602,.423,.343,.652,.536,.873,.875,1.142,.396,.325,.609,.634,.409,.417,.987,.989,
.931,.330,.426,.309)
b<-c(1,2,4,1,5,6,2,3,5,1,3,7,2,6,7,4,5,7,3,4,6)
trt<-c(rep("A",3),rep("B",3),rep("C",3),rep("D",3),rep("E",3),rep("F",3),rep("g",3))

pDurSkiMa(x,b,trt)




