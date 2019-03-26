library(NHMSAR)


### Name: Mstep.classif
### Title: fit an AR model for each class of C
### Aliases: Mstep.classif
### Keywords: MSAR with a priori classification ~kwd2

### ** Examples

	data(meteo.data)
data = array(meteo.data$temperature,c(31,41,1)) 
k = 40
T = dim(data)[1]
N.samples = dim(data)[2]
d = dim(data)[3]
order = 2
C = array(meteo.data>0,c(31,41,1))
res = Mstep.classif(data,C,order=order)
str(res)



