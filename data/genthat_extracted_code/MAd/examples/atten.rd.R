library(MAd)


### Name: atten
### Title: Correction for Attenuation
### Aliases: atten
### Keywords: data

### ** Examples

# Sample data:

id<-c(1, 1:19)
n<-c(10,20,13,22,28,12,12,36,19,12,36,75,33,121,37,14,40,16,14,20)
g<-c(.68,.56,.23,.64,.49,-.04,.49,.33,.58,.18,-.11,.27,.26,.40,.49,
 .51,.40,.34,.42,.16)
var.g <- c(.08,.06,.03,.04,.09,.04,.009,.033,.0058,.018,.011,.027,.026,.0040,
  .049,.0051,.040,.034,.0042,.016)
xx<-c(.88,.86,.83,.64,.89,.84,.89,.83,.99,.88,.81,.77,.86,.70,.79,
 .71,.80,.74,.82,.86)  # Reliability of "independent variable"
yy<-c(.99,.86,.83,.94,.89,.94,.89,.93,.99,.88,.81,.77,.86,.70,.79,
 .71,.80,.94,.92,.96)  # Reliability of "dependent variable"
   
df<-data.frame(id,n,g, var.g, xx,yy)

# Example        
atten(g= g, xx = xx, yy = yy, data= df) 



