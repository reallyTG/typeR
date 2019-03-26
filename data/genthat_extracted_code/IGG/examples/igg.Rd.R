library(IGG)


### Name: igg
### Title: Inverse Gamma-Gamma Regression
### Aliases: igg

### ** Examples


###################### 
# Load diabetes data #
######################
data(diabetes)
attach(diabetes)
X <- scale(diabetes$x)
y <- scale(diabetes$y)

################################
# Fit the IGG regression model #
################################
igg.model <- igg(X=X, y=y, max.steps=5000, burnin=2500)

##############################
# Posterior median estimates #
##############################
igg.model$beta.med

###########################################
# 95 percent posterior credible intervals #
###########################################
igg.model$beta.intervals

######################
# Variable selection #
######################
igg.model$igg.classifications




