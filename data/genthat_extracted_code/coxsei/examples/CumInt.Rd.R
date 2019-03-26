library(coxsei)


### Name: CumInt
### Title: Cumulative intensity function
### Aliases: CumInt
### Keywords: ~survival

### ** Examples


curve(CumInt(x,int=function(y)1*( y>=0 & y<2)+3*(y>=2 & y<3)+1*(y>=3)),
      0,5,xlab="t",ylab="H(t) of a piece-wise constant hazard fun h(t)")   



