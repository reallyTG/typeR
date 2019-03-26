library(PairedData)


### Name: plot
### Title: ~~ Methods for Function 'plot' ~~
### Aliases: plot.paired plot,paired-method
### Keywords: methods

### ** Examples

data(HorseBeginners)
pd1<-with(HorseBeginners,paired(Actual,Imaginary))
plot(pd1)
plot(pd1,type="BA")
plot(pd1,type="McNeil")
plot(pd1,type="profile")

data(Shoulder)
with(Shoulder,plot(paired(Left,Right),groups=Group))
with(Shoulder,plot(paired(Left,Right),groups=Group,facet=FALSE))
with(Shoulder,plot(paired(Left,Right),
groups=Group,facet=FALSE,type="profile"))+theme_bw()



