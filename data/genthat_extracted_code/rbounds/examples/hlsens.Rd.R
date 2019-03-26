library(rbounds)


### Name: hlsens
### Title: Rosenbaum Bounds for Hodges-Lehmann Point Estimate
### Aliases: hlsens

### ** Examples


# Replication of Rosenbaum Sensitivity Tests From Chapter 4 of
# Observational Studies

# Data: Matched Data of Lead Blood Levels in Children
trt <- c(38, 23, 41, 18, 37, 36, 23, 62, 31, 34, 24, 14, 21, 17, 16, 20,
15, 10, 45, 39, 22, 35, 49, 48, 44, 35, 43, 39, 34, 13, 73, 25, 27)

ctrl <- c(16, 18, 18, 24, 19, 11, 10, 15, 16, 18, 18, 13, 19, 10, 16,
16, 24, 13, 9, 14, 21, 19, 7, 18, 19, 12, 11, 22, 25, 16, 13, 11, 13)

hlsens(trt, ctrl)

# Load Matching Software and Data
library(Matching)
data(lalonde)

# Estimate Propensity Score
DWglm <- glm(treat~age + I(age^2) + educ + I(educ^2) + black + hisp +
             married + nodegr + re74 + I(re74^2) + re75 + I(re75^2) +
             u74 + u75, family=binomial, data=lalonde)

# Save data objects
Y  <- lalonde$re78   # the outcome of interest
Tr <- lalonde$treat  # the treatment of interest

# Match - without replacement
mDW  <- Match(Y=Y, Tr=Tr, X=DWglm$fitted, replace=FALSE)

# One should check balance, but let's skip that step for now.

# Sensitivity Test:
hlsens(mDW, pr=.1, Gamma=1.5, GammaInc=.25)



