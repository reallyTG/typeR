library(GrimR)


### Name: fit.joel
### Title: Function fit.joel
### Aliases: fit.joel

### ** Examples

# With 360 deg. data:
res<-fit.joel(Carman,MR=NULL,cw="ccw",optimMR=TRUE)
Wulffplot(res) #Plot data on a Wulff net
#with 180 degree data:
res<-fit.joel(Gunter,MR=-0.89,cw="cw",optimMR=FALSE)
Wulffplot(res) #Plot data on a Wulff net



