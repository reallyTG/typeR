library(GD)


### Name: gdm
### Title: Geographical detectors: a one-step function.
### Aliases: gdm print.gdm plot.gdm

### ** Examples

###############
## NDVI: ndvi_40
###############
## define elements orders of categorical variables
cz <- c("Bwk","Bsk","Dwa","Dwb","Dwc") ## climate zone
mp <- c("very low","low","medium","high","very high") ## mining production
ndvi_40$Climatezone <- as.numeric(1:5)[match(ndvi_40$Climatezone, cz)]
ndvi_40$Mining <- as.numeric(1:5)[match(ndvi_40$Mining, mp)]
## set optional parameters of optimal discretization
## optional methods: equal, natural, quantile, geometric, sd and manual
discmethod <- c("equal","natural","quantile")
discitv <- c(4:6)
## "gdm" function
ndvigdm <- gdm(NDVIchange ~ Climatezone + Mining + Tempchange + GDP,
               continuous_variable = c("Tempchange", "GDP"),
               data = ndvi_40,
               discmethod = discmethod, discitv = discitv)
ndvigdm
# plot(ndvigdm)
## Not run: 
##D #############
##D ## H1N1: h1n1_100
##D #############
##D ## set optional parameters of optimal discretization
##D discmethod <- c("equal","natural","quantile")
##D discitv <- c(4:6)
##D continuous_variable <- colnames(h1n1_100)[-c(1,11)]
##D ## "gdm" function
##D h1n1gdm <- gdm(H1N1 ~ .,
##D                continuous_variable = continuous_variable,
##D                data = h1n1_100,
##D                discmethod = discmethod, discitv = discitv)
##D h1n1gdm
##D plot(h1n1gdm)
## End(Not run)




