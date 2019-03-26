library(MasterBayes)


### Name: PdataPed
### Title: PdataPed Object
### Aliases: PdataPed is.PdataPed
### Keywords: classes

### ** Examples

id<-1:20
sex<-sample(c("Male", "Female"),20, replace=TRUE)
offspring<-c(rep(0,18),1,1)
lat<-rnorm(20)
long<-rnorm(20)
mating_type<-gl(2,10, label=c("+", "-"))

test.data<-data.frame(id, offspring, lat, long, mating_type, sex)

res1<-expression(varPed("offspring", restrict=0))
var1<-expression(varPed(c("lat", "long"), gender="Male", 
  relational="OFFSPRING"))
var2<-expression(varPed(c("mating_type"), gender="Female", 
  relational="MATE"))
var3<-expression(varPed("mating_type", gender="Male"))

PdP<-PdataPed(formula=list(res1, var1, var2, var3), data=test.data)




