library(qle)


### Name: qle
### Title: Simulated quasi-likelihood parameter estimation
### Aliases: qle

### ** Examples

data(normal)
 
# main estimation with new evaluations
# (simulations of the statistical model)
OPT <- qle(qsd,qsd$simfn,nsim=10,
		    global.opts=list("maxeval"=1),
 		local.opts=list("test"=FALSE)) 




