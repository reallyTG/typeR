library(ChainLadder)


### Name: ClarkCapeCod
### Title: Clark Cape Cod method
### Aliases: ClarkCapeCod
### Keywords: models

### ** Examples

X <- GenIns
colnames(X) <- 12*as.numeric(colnames(X))
CC.loglogistic  <- ClarkCapeCod(X, Premium=10000000+400000*0:9, maxage=240)
CC.loglogistic

# Clark's "CapeCod method" also works with triangles that have  
# more development periods than origin periods. The Premium
# is a contrived match to the "made up" 'qincurred' Triangle.
ClarkCapeCod(qincurred, Premium=1250+150*0:11, G="loglogistic")

# Method also works for a "triangle" with only one row:
# 1st row of GenIns; need "drop=FALSE" to avoid becoming a vector.
ClarkCapeCod(GenIns[1, , drop=FALSE], Premium=1000000, maxage=20)

# If one value of Premium is appropriate for all origin years
# (e.g., losses are on-level and adjusted for exposure)
# then only a single value for Premium need be provided.
ClarkCapeCod(GenIns, Premium=1000000, maxage=20)

# Use of the weibull function generates a warning that the parameter risk 
# approximation results in some negative variances. This may be of small 
# concern since it happens only for older years with near-zero 
# estimated reserves, but the warning should not be disregarded 
# if it occurs with real data.
Y <- ClarkCapeCod(qincurred, Premium=1250+150*0:11, G="weibull")

# The plot of the standardized residuals by age indicates that the more
# mature observations are more loosely grouped than the less mature, just
# the opposite of the behavior under the loglogistic curve.
# This suggests that the model might be improved by analyzing the Triangle 
# in two different "blocks": less mature vs. more mature. 
# The QQ-plot shows that the tails of the empirical distribution of
# standardized residuals are "fatter" than a standard normal. 
# The fact that the p-value is essentially zero says that there is 
# virtually no chance that the standardized residuals could be 
# considered draws from a standard normal random variable.
# The overall conclusion is that Clark's ODP-based CapeCod model with 
# the weibull growth function does not match up well with the qincurred 
# triangle and these premiums.
plot(Y) 



