library(gap)


### Name: htr
### Title: Haplotype trend regression
### Aliases: htr
### Keywords: regression

### ** Examples

## Not run: 
##D # 26-10-03
##D # this is now part of demo
##D test2<-read.table("test2.dat")
##D y<-test2[,1]
##D x<-test2[,-1]
##D y<-as.matrix(y)
##D x<-as.matrix(x)
##D htr.test2<-htr(y,x)
##D htr.test2
##D htr.test2<-htr(y,x,n.sim=10)
##D htr.test2
##D 
##D # 13-11-2003
##D data(apoeapoc)
##D apoeapoc.gc<-gc.em(apoeapoc[,5:8])
##D y<-apoeapoc$y
##D for(i in 1:length(y)) if(y[i]==2) y[i]<-1
##D htr(y,apoeapoc.gc$htrtable)
##D 
##D # 20-8-2008
##D # part of the example from useR!2008 tutorial by Andrea Foulkes
##D # It may be used beyond the generalized linear model (GLM) framework
##D HaploEM <- haplo.em(Geno,locus.label=SNPnames)
##D HapMat <- HapDesign(HaploEM)
##D m1 <- lm(Trait~HapMat)
##D m2 <- lm(Trait~1)
##D anova(m2,m1)
## End(Not run)



