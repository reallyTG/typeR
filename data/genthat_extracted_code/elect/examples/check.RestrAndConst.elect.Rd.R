library(elect)


### Name: check.RestrAndConst.elect
### Title: Checking the definition of 'RestrAndConst' in 'elect'
### Aliases: check.RestrAndConst.elect

### ** Examples

# Fit model with constraints:
Q     <- rbind(c(0,0.01,0.01), c(0,0,0.01), c(0,0,0))
model <- msm(state~age, subject = id, data = ELECTData,
             center = FALSE, qmatrix = Q, death = TRUE,
             fixedpars = c(7,8), covariates = ~age+x)
RestrAndConst <- c(1:6,0,0,7)
CHECK <- check.RestrAndConst.elect(model, RestrAndConst, PRINT= TRUE)

# Usage: elect(x = model,..., RestrAndConst = RestrAndConst)



