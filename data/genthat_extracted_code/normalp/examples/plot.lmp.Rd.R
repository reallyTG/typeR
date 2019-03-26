library(normalp)


### Name: plot.lmp
### Title: Diagnostic plots for a lmp object
### Aliases: plot.lmp
### Keywords: hplot

### ** Examples

x<-1:20
z<-runif(20)
e<-rnormp(20,mu=0,sigmap=1,p=3)
y<-0.5+x+z+e
lmp.res<-lmp(y~x+z)
plot(lmp.res)



