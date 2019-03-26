library(kin.cohort)


### Name: kin.cohort
### Title: Analysis of kin-cohort data
### Aliases: kin.cohort
### Keywords: survival

### ** Examples

## Not run: 
##D data(kin.data)
##D attach(kin.data)
##D 
##D res.k<-   kin.cohort(age, cancer, gen1, rel, knots=c(30,40,50,60,70,80), f=0.02, 
##D                      method="km")
##D res.k          
##D plot(res.k)
##D plot(res.k,what="crr")
##D 
##D set.seed(1)
##D res.k.b<- kin.cohort(age, cancer, gen1, rel, knots=c(30,40,50,60,70,80), f=0.02, 
##D                      set=family, method="km", B=10)
##D res.k.b
##D plot(res.k.b)
##D plot(res.k.b,what="crr")
##D 
##D res.m<-   kin.cohort(age, cancer, gen1, rel, knots=c(30,40,50,60,70,80), f=0.02, 
##D                     method="mml")
##D res.m
##D plot(res.m)
##D plot(res.m, what="hr")
##D 
##D res.m2<-  kin.cohort(age, cancer, data.frame(gen1,gen2), rel, 
##D                      knots=c(30,40,50,60,70,80), f=c(0.02,0.01), method="mml")
##D res.m2
##D plot(res.m2)
##D plot(res.m2, what="hr")
##D 
##D set.seed(1)
##D res.m.b<- kin.cohort(age, cancer, gen1, rel, knots=c(30,40,50,60,70,80), f=0.02, 
##D                      set=family, method="mml", B=10)
##D res.m.b
##D plot(res.m.b)
##D plot(res.m.b, what="hr")
## End(Not run)



