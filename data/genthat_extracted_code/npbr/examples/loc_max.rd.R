library(npbr)


### Name: loc_max
### Title: Local maximum frontier estimators
### Aliases: loc_max
### Keywords: nonparametric

### ** Examples

data("green")
x.green <- seq(min(log(green$COST)), max(log(green$COST)), 
 length.out=101)
# Local maximum frontier estimates
# a. Local constant estimator
loc_max_1stage<-loc_max(log(green$COST), log(green$OUTPUT), 
 x.green, h=0.5, type="one-stage")
# b. Local DEA estimator
loc_max_2stage<-loc_max(log(green$COST), log(green$OUTPUT), 
 x.green, h=0.5, type="two-stage")  
# Representation 
plot(log(OUTPUT)~log(COST), data=green)
lines(x.green, loc_max_1stage, lty=1, col="magenta")
lines(x.green, loc_max_2stage, lty=2, col="cyan")
legend("topleft",legend=c("one-stage", "two-stage"), 
 col=c("magenta","cyan"), lty=c(1,2))



