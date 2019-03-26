library(mixexp)


### Name: MixModel
### Title: Fit mixture and mixture process variable models.
### Aliases: MixModel
### Keywords: regression

### ** Examples

# example from Lawson(2014), quadratic model
library(daewr)
data(pest)
mixvars<-c("x1","x2","x3")
MixModel(pest,"y",mixvars,2)

# example from Myers and Montgomery(2002), special cubic model
library(mixexp)
etch<-SCD(3)
etch<-Fillv(3,etch)
etch<-rbind(etch[1:7, ],etch[1:3, ],etch[7, ], etch[etch$x1==2/3, ],
etch[etch$x2==2/3, ],etch[etch$x3==2/3, ])
erate<-c(540,330,295,610,425,330,800,560,350,260,850,710,640,460)
etch<-cbind(etch,erate)
mixvars<-c("x1","x2","x3")
response<-c("erate")
MixModel(etch,response,mixvars,4)

# example Mixture process variable model from Sahni, Pieple and Naes(2009)
library(daewr)
mixvars<-c("x1","x2","x3")
procvars<-c("z1","z2")
data(MPV)
MixModel(MPV,"y",mixvars,5,procvars)

#### Kowalski Cornell and Vining Simplified model on data from Gallant et. al. (2008)
data(Burn)
testBNM<-MixModel(Burn,"y",mixcomps=c("Course","Fine","Binder"),model=6,procvars=c("z"))


          


