library(RRTCS)


### Name: ChaudhuriChristofides
### Title: Chaudhuri-Christofides model
### Aliases: ChaudhuriChristofides
### Keywords: ChaudhuriChristofides Confidence_interval Estimation
###   Quantitative Randomized_response Transformed_variable Variance

### ** Examples

N=417
data(ChaudhuriChristofidesData)
dat=with(ChaudhuriChristofidesData,data.frame(z,Pi))
mu=c(6,6)
sigma=sqrt(c(10,10))
cl=0.95
data(ChaudhuriChristofidesDatapij)
ChaudhuriChristofides(dat$z,mu,sigma,dat$Pi,"mean",cl,pij=ChaudhuriChristofidesDatapij)



