library(rdd)


### Name: DCdensity
### Title: McCrary Sorting Test
### Aliases: DCdensity

### ** Examples

#No discontinuity
x<-runif(1000,-1,1)
DCdensity(x,0)

#Discontinuity
x<-runif(1000,-1,1)
x<-x+2*(runif(1000,-1,1)>0&x<0)
DCdensity(x,0)



