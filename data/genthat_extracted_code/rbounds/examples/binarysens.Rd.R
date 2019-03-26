library(rbounds)


### Name: binarysens
### Title: Sensitivity Test for Matched Binary Outcome
### Aliases: binarysens

### ** Examples
 
# Example From Rosenbaum Observational Studies Pg 112
# Success: Died From Lung Cancer
# 110 Discrepant Pairs
# 12 Discrepant Pairs

# Sensitivity Test
binarysens(12,110)

# Example Using Match()

#Load Matching Software and Data

library(Matching)
data(GerberGreenImai)

# Estimate Propensity Score
pscore.glm <- glm(PHN.C1 ~ PERSONS + VOTE96.1 + NEW + 
    MAJORPTY + AGE + WARD + PERSONS:VOTE96.1 + PERSONS:NEW + 
    AGE2, family = binomial(logit), data = GerberGreenImai)

#save data objects
D <- GerberGreenImai$PHN.C1
Y <- GerberGreenImai$VOTED98
X <- fitted(pscore.glm)

# Match - without replacement
m.obj <- Match(Y = Y, Tr = D, X = X, M = 1, replace=FALSE)
summary(m.obj)

# One should check balance, but let's skip that step for now.

# Sensitivity Test
binarysens(m.obj, Gamma=2, GammaInc=.1)




