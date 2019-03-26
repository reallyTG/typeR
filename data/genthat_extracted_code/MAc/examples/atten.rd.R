library(MAc)


### Name: atten
### Title: Correction for Attenuation
### Aliases: atten
### Keywords: data

### ** Examples

# Sample data:

id <-c(1, 1:19)
n <-c(10,20,13,22,28,12,12,36,19,12,36,75,33,121,37,14,40,16,14,20)
r <-c(.68,.56,.23,.64,.49,-.04,.49,.33,.58,.18,-.11,.27,.26,.40,.49,
 .51,.40,.34,.42,.16)
xx <-c(.88,.86,.83,.64,.89,.84,.89,.83,.99,.88,.81,.77,.86,.70,.79,
 .71,.80,.74,.82,.86)  # Reliability of "independent variable"
yy <-c(.99,.86,.83,.94,.89,.94,.89,.93,.99,.88,.81,.77,.86,.70,.79,
 .71,.80,.94,.92,.96)  # Reliability of "dependent variable"
   
dat<-data.frame(id, n, r, xx,yy)

# Example        
atten(es= r, xx = xx, yy = yy, data= dat) 



