library(event)


### Name: coxre
### Title: Cox Proportional Hazards Model with Random Effect
### Aliases: coxre print.llrf
### Keywords: models

### ** Examples

# 11 individuals, each with 5 responses
y <- matrix(c(51,36,50,35,42,
	27,20,26,17,27,
	37,22,41,37,30,
	42,36,32,34,27,
	27,18,33,14,29,
	43,32,43,35,40,
	41,22,36,25,38,
	38,21,31,20,16,
	36,23,27,25,28,
	26,31,31,32,36,
	29,20,25,26,25),ncol=5,byrow=TRUE)
# Different intensity functions
coxre(response=y, censor=matrix(rep(1,55),ncol=5), nest=1:11,
	est=0.7, stratified=TRUE)
# Proportional intensity functions for the five responses
coxre(response=y, censor=matrix(rep(1,55),ncol=5), nest=1:11,
	est=0.7, stratified=FALSE)
# Identical intensity functions
coxre(response=as.vector(t(y)), censor=rep(1,55),
	nest=rep(1:11,rep(5,11)), est=0.7)



