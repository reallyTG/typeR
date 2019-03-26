library(WeibullR)


### Name: pivotal.rr
### Title: Pivotal 'Monte Carlo' re-sampling of least squares linear
###   regression models
### Aliases: pivotal.rr
### Keywords: regression reliability

### ** Examples

failures<-c(90,96,30,49,82)
suspensions<-c(100,45,10)
data_positions<-getPPP(failures,suspensions)
fit<-lslr(data_positions)
prr_value<-pivotal.rr(data_positions,R2=fit[3],CI=0, unrel=.5)
## note: unrel value has no meaning when CI=0



