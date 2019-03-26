library(lmomPi)


### Name: qua
### Title: Generic function for 'qua...': probabilily distribution fitting
###   with L-Moments
### Aliases: qua

### ** Examples


# Sample L-moments of Ozone from the airquality data
data(airquality)
lmom <- samlmu(airquality$Ozone,nmom=6)

distrib <- c("exp","gam","gev","glo","gpa","gno","gum","kap","ln3","nor",
	"pe3","wak","wei")

para_list <- pel(distrib=distrib,lmom=lmom)
f <- (1:10)/10
qua_list <- qua(para=para_list,f=f)





