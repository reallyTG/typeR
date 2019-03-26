library(mixexp)


### Name: ModelPlot
### Title: This function makes contour plots of a user-supplied model in
###   the simplex mixture space.
### Aliases: ModelPlot
### Keywords: hplot

### ** Examples

# Cornell's (2002) Yarn elongation
x1<-c(1,1,.5,.5,.5,0,0,0,0,0,0,0,.5,.5,.5)
x2<-c(0,0,.5,.5,.5,1,1,.5,.5,.5,0,0,0,0,0)
x3<-c(0,0,0,0,0,0,0,.5,.5,.5,1,1,.5,.5,.5)
y<-c(11,12.4,15,14.8,16.1,8.8,10,10,9.7,11.8,16.8,16,17.7,16.4,16.6)
elong<-data.frame(x1,x2,x3,y)
testQ<-lm(y~-1+x1+x2+x3+x1:x2+x1:x3+x2:x3,data=elong)
ModelPlot(model = testQ,dimensions = list(x1="x1",x2="x2",x3="x3"), 
           main="Thread Elongation",constraints=FALSE,contour=TRUE,
           at=c(12, 13, 14, 15, 16, 17),fill=FALSE,
           axislabs=c("X1", "X2", "X3"),
           cornerlabs = c("X1", "X2", "X3"),pseudo=FALSE)
           

# Cornells famous fish patty experiment 
data(fishp)
fishmod2<-MixModel(fishp, "y", mixcomps=c("x1","x2","x3"),model=5,procvars=c("z1","z2","z3"))
ModelPlot(fishmod2,dimensions = list(x1="x1",x2="x2",x3="x3"), 
          slice = list(process.vars=c(z1=-1, z2=-1, z3=-1)), main="z1=-1, z2=-1, z3=-1",
          constraints=FALSE,contour=TRUE,cuts=10,fill=FALSE,
          axislabs=c("Fraction X1","Fraction X2","Fraction X3"),
          cornerlabs = c("X1", "X2", "X3"),pseudo=FALSE)
          
          
#### Kowalski Cornell and Vining Simplified model on data from Gallant et. al. (2008)
data(Burn)
testBNM<-MixModel(Burn,"y",mixcomps=c("Course","Fine","Binder"),model=6,procvars=c("z"))
ModelPlot(testBNM,dimensions = list(x1="Course",x2="Fine",x3="Binder"), 
          slice = list(process.vars=c(z=1)), lims=c(.403,.704,.166,.467,.130,.431), main="z=1",
          constraints=TRUE,contour=TRUE,cuts=5,fill=FALSE,
          axislabs=c("Fraction Course","Fraction Fine","Fraction Binder"),
          cornerlabs = c("Course", "Fine", "Binder"),pseudo=TRUE)

ModelPlot(testBNM,dimensions = list(x1="Course",x2="Fine",x3="Binder"), 
          slice = list(process.vars=c(z=-1)),  lims=c(.403,.704,.166,.467,.130,.431),main="z=-1",
          constraints=TRUE,contour=TRUE,cuts=5,fill=FALSE,
          axislabs=c("Fraction Course","Fraction Fine","Fraction Binder"),
          cornerlabs = c("Course", "Fine", "Binder"),pseudo=TRUE)

          



