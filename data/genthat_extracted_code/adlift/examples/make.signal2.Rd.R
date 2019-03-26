library(adlift)


### Name: make.signal2
### Title: make.signal2
### Aliases: make.signal2
### Keywords: datagen

### ** Examples

#create grid vector
#
xgrid<-rnorm(50)
xgrid
#
pp<-make.signal2("ppoly",x=xgrid)
#
#piecewise polynomial data vector 
#
plot(sort(xgrid),pp[order(xgrid)],type="l")
# 



