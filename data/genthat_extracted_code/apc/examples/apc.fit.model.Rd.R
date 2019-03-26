library(apc)


### Name: apc.fit.model
### Title: Fits an age period cohort model
### Aliases: apc.fit.model apc.fit.table
### Keywords: package models regression htest

### ** Examples

#####################
#	EXAMPLE 1 with Italian bladder cancer data

data.list	<- data.Italian.bladder.cancer()	#	function gives data list
apc.fit.table(data.list,"poisson.dose.response")

#	       -2logL df.residual prob(>chi_sq) LR.vs.APC df.vs.APC prob(>chi_sq)       aic
#	APC    33.179          27         0.191        NA        NA            NA   487.624
#	AP    512.514          40         0.000   479.335        13         0.000   940.958
#	AC     39.390          30         0.117     6.211         3         0.102   487.835
#	PC   1146.649          36         0.000  1113.470         9         0.000  1583.094
#	Ad    518.543          43         0.000   485.364        16         0.000   940.988
#	Pd   4041.373          49         0.000  4008.194        22         0.000  4451.818
#	Cd   1155.629          39         0.000  1122.450        12         0.000  1586.074
#	A    2223.800          44         0.000  2190.621        17         0.000  2644.245
#	P   84323.944          50         0.000 84290.765        23         0.000 84732.389
#	C   23794.205          40         0.000 23761.026        13         0.000 24222.650
#	t    4052.906          52         0.000  4019.727        25         0.000  4457.351
#	tA   5825.158          53         0.000  5791.979        26         0.000  6227.602
#	tP  84325.758          53         0.000 84292.579        26         0.000 84728.203
#	tC  33446.796          53         0.000 33413.617        26         0.000 33849.241
#	1   87313.678          54         0.000 87280.499        27         0.000 87714.123
#
#	Table suggests that "APC" and "AC" fit equally well.  Try both

fit.apc	<- apc.fit.model(data.list,"poisson.dose.response","APC")
fit.ac	<- apc.fit.model(data.list,"poisson.dose.response","AC")

#	Compare the estimates: They are very similar

fit.apc$coefficients.canonical
fit.ac$coefficients.canonical

#####################
#	EXAMPLE 2 with Belgian lung cancer data
#	This example illustrates how to find the linear predictors 

data.list	<- data.Belgian.lung.cancer()

#	Get an APC fit

fit.apc	<- apc.fit.model(data.list,"poisson.dose.response","APC")

#	The linear predictor of the fit is a vector.
#	But, we would like it in the same format as the data.
#	Thus create matrix of same dimension as response data
#	This can be done in two ways

m.lp	<- data.list$response	#	using original information	
m.lp	<- fit.apc$response		# 	using information copied when fitting

#	the fit object index.data is used to fill linear predictor in
#	vector format into matrix format

m.lp[fit.apc$index.data]	<-fit.apc$linear.predictors
exp(m.lp)

#####################
#	EXAMPLE 3 with Belgian lung cancer data
#	This example illustrates how apc.fit.model works.

data.list	<- data.Belgian.lung.cancer()

#	Vectorise data
index		<- apc.get.index(data.list)
v.response	<- data.list$response[index$index.data]
v.dose		<- data.list$dose[index$index.data]

#	Get design
m.design	<- apc.get.design(index,"APC")$design

#	Fit using glm.fit from stats package
fit.apc.glm	<- glm.fit(m.design,v.response,family=poisson(link="log"),offset=log(v.dose))

#	Get canonical coefficients
v.cc		<- fit.apc.glm$coefficients

#	Find linear predictors and express in matrix form
m.fit		<- data.list$response			#	create matrix
m.fit[index$index.data]		<- m.design 
m.fit.offset		<- m.fit + log(data.list$dose)	#	add offset
exp(m.fit.offset)

#	Compare with linear.predictors from glm.fit
#	difference should be zero
sum(abs(m.fit.offset[index$index.data]-fit.apc.glm$linear.predictors))

#####################
#	EXAMPLE 4 with Taylor-Ashe loss data
#	This example illustrates the over-dispersed poisson response model.

data <- data.loss.TA()
fit.apc.od <- apc.fit.model(data,"od.poisson.response","APC")
fit.apc.od$coefficients.canonical[1:5,]
fit.apc.no.od <- apc.fit.model(data,"poisson.response","APC")
fit.apc.no.od$coefficients.canonical[1:5,]



