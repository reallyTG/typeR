library(rbounds)


### Name: data.prep
### Title: Format Match() object for sensitivity test.
### Aliases: data.prep

### ** Examples
 

# Load Matching Software and Data
library(Matching)
data(lalonde)

# Estimate Propensity Score
DWglm <- glm(treat~age + I(age^2) + educ + I(educ^2) + black + hisp +
             married + nodegr + re74 + I(re74^2) + re75 + I(re75^2) +
             u74 + u75, family=binomial, data=lalonde)

# Save data objects
Y  <- lalonde$re78    # the outcome of interest
Tr <- lalonde$treat   # the treatment of interest

# Match      
mDW  <- Match(Y = Y, Tr = Tr, X = DWglm$fitted, M = 2)

# One should check balance, but let's skip that step for now.

# Create Data Object
tmp <- data.prep(mDW, group.size=3)

# Sensitivity Test
mcontrol(tmp$Y, tmp$id, tmp$treat, group.size = 3)



