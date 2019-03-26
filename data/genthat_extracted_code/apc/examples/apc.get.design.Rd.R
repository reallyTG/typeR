library(apc)


### Name: apc.get.design
### Title: Create design matrices
### Aliases: apc.get.design apc.get.design.collinear

### ** Examples

#####################
#	EXAMPLE 1 with Belgian lung cancer data
#	This example illustrates how apc.fit.model works.

data.list	<- data.Belgian.lung.cancer()

#	Vectorise data
index		<- apc.get.index(data.list)
v.response	<- data.list$response[index$index.data]
v.dose		<- data.list$dose[index$index.data]

#	Get design
m.design.apc	<- apc.get.design(index,"APC")$design

#	Fit using glm.fit from stats package
fit.apc.glm	<- glm.fit(m.design.apc,v.response,family=poisson(link="log"),offset=log(v.dose))
fit.apc.glm$deviance

#	Compare with standard output from apc.fit.model
apc.fit.model(data.list,"poisson.dose.response","APC")$deviance

#####################
#	EXAMPLE 2 with Belgian lung cancer data
#	The age-drift model gives a good fit.
#	This fit can be refined to a cubic or quadratic age effect.
#	The latter is not precoded so one will have to work directly with the design matrix.
#	SEE ALSO VIGNETTE

data.list	<- data.Belgian.lung.cancer()

#	Vectorise data
index		<- apc.get.index(data.list)
v.response	<- data.list$response[index$index.data]
v.dose		<- data.list$dose[index$index.data]

#	Get design matrix for "Ad"
m.design.ad	<- apc.get.design(index,"Ad")$design

#	Modify design matrix for cubic or quadratic age effect
#	Note this implies a linear or constant double difference
#	Quadractic age effect: restrict double differences to be equal
p	<- ncol(m.design.ad)
m.rest.q	<- matrix(data=0,nrow=p,ncol=4)
m.rest.q[1,1]	<- 1
m.rest.q[2,2]	<- 1
m.rest.q[3,3]	<- 1
m.rest.q[4:p,4]	<- 1
m.design.adq	<- m.design.ad %*% m.rest.q
#	Cubic age effect: restrict double differences to be linear
m.rest.c	<- matrix(data=0,nrow=p,ncol=5)
m.rest.c[1,1]	<- 1
m.rest.c[2,2]	<- 1
m.rest.c[3,3]	<- 1
m.rest.c[4:p,4]	<- 1
m.rest.c[4:p,5]	<- seq(1,p-3)
m.design.adc	<- m.design.ad %*% m.rest.c

#	Poisson regression for dose-response and with log link
fit.ad	<- glm.fit(m.design.ad,v.response,family=poisson(link="log"),offset=log(v.dose))
fit.adc	<- glm.fit(m.design.adc,v.response,family=poisson(link="log"),offset=log(v.dose))
fit.adq	<- glm.fit(m.design.adq,v.response,family=poisson(link="log"),offset=log(v.dose))

#	Deviance tests
fit.adc$deviance - fit.ad$deviance 
fit.adq$deviance - fit.ad$deviance 
#	Degrees of freedom
ncol(m.design.ad) - ncol(m.design.adc)
ncol(m.design.ad) - ncol(m.design.adq)




