library(neuralnet)


### Name: gwplot
### Title: Plot method for generalized weights
### Aliases: gwplot
### Keywords: neural

### ** Examples


data(infert, package="datasets")
print(net.infert <- neuralnet(case~parity+induced+spontaneous, infert, 
		                err.fct="ce", linear.output=FALSE, likelihood=TRUE))
gwplot(net.infert, selected.covariate="parity")
gwplot(net.infert, selected.covariate="induced")
gwplot(net.infert, selected.covariate="spontaneous")




