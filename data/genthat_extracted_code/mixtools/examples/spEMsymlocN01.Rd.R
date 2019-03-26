library(mixtools)


### Name: spEMsymlocN01
### Title: semiparametric EM-like algorithm for univariate mixture in False
###   Discovery Rate (FDR) estimation
### Aliases: spEMsymlocN01
### Keywords: file

### ** Examples

## Probit transform of p-values
## from a Beta-Uniform mixture model
## comparion of parametric and semiparametric EM fit
## Note: in actual situations n=thousands 
set.seed(50)
n=300 # nb of multiple tests
m=2 # 2 mixture components
a=c(1,0.1); b=c(1,1); lambda=c(0.6,0.4) # parameters
z=sample(1:m, n, rep=TRUE, prob = lambda)
p <- rbeta(n, shape1 = a[z], shape2 = b[z]) # p-values
o <- order(p)
cpd <- cbind(z,p)[o,] # sorted complete data, z=1 if H0, 2 if H1
p <- cpd[,2] # sorted p-values

y <- qnorm(p) # probit transform of the pvalues
# gaussian EM fit with component 1 constrained to N(0,1)
s1 <- normalmixEM(y, mu=c(0,-4), 
				mean.constr = c(0,NA), sd.constr = c(1,NA)) 
s2 <- spEMsymlocN01(y, mu0 = c(0,-3)) # spEM with N(0,1) fit
hist(y, freq = FALSE, col = 8, main = "histogram of probit(pvalues)")
plot(s2, add.plot = TRUE, lwd = 2)

# Exemples of plot capabilities
# Note: posteriors must be ordered by p for plot.FDR
# plotFDR(s1$post) # when true complete data not observed
# plotFDR(s1$post, s2$post) # comparing 2 strategies
plotFDR(s1$post, s2$post, lg1 = "normalmixEM", lg2 = "spEMsymlocN01", 
		complete.data = cpd) # with true FDR computed from z



