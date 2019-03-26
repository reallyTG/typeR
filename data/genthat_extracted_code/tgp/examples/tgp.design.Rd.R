library(tgp)


### Name: tgp.design
### Title: Sequential Treed D-Optimal Design for Treed Gaussian Process
###   Models
### Aliases: tgp.design
### Keywords: design optimize spatial tree

### ** Examples

#
# 2-d Exponential data
# (This example is based on random data.  
# It might be fun to run it a few times)
#

# get the data
exp2d.data <- exp2d.rand()
X <- exp2d.data$X; Z <- exp2d.data$Z
Xcand <- exp2d.data$XX

# fit treed GP LLM model to data w/o prediction
# basically just to get MAP tree (and plot it)
out <- btgpllm(X=X, Z=Z, pred.n=FALSE, corr="exp")
tgp.trees(out)

# find a treed sequential D-Optimal design 
# with 10 more points.  It is interesting to 
# contrast this design with one obtained via
# the dopt.gp function
XX <- tgp.design(10, Xcand, out)

# now fit the model again in order to assess
# the predictive surface at those new design points
dout <- btgpllm(X=X, Z=Z, XX=XX, corr="exp")
plot(dout)



