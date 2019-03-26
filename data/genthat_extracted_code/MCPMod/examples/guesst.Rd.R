library(MCPMod)


### Name: guesst
### Title: Calculate guesstimates based on prior knowledge
### Aliases: guesst
### Keywords: models

### ** Examples

# Emax model
# Expected percentage of maximum effect: 0.8 is associated with
# dose 0.3 (d,p)=(0.3, 0.8), dose range [0,1]
emx1 <- guesst(d=0.3, p=0.8, model="emax")
# local approach
emx2 <- guesst(d=0.3, p=0.8, model="emax", local = TRUE, Maxd = 1)
# plot models
models <- list(emax=c(emx1, emx2))
plotModels(models, c(0,1), base= 0, maxEff = 1)

# Logistic model
# Select two (d,p) pairs (0.2, 0.5) and (0.6, 0.95)
lgc1 <- guesst(d = c(0.2, 0.5), p = c(0.6, 0.95), "logistic")
# local approach
lgc2 <- guesst(d = c(0.2, 0.5), p = c(0.6, 0.95), "logistic", 
               local = TRUE, Maxd = 1)
# plot models
models <- list(logistic = matrix(c(lgc1, lgc2), byrow = TRUE, nrow = 2))
plotModels(models, c(0,1), base= 0, maxEff = 1)

# Beta Model
# Select one pair (d,p): (0.5,0.5)
# dose, where maximum occurs: 0.8
bta <- guesst(d=0.5, p=0.5, model="betaMod", dMax=0.8, scal=1.2)
# plot
models <- list(betaMod = bta)
plotModels(models, c(0,1), base= 0, maxEff = 1)

# Sigmoid Emax model
# Select two (d,p) pairs (0.2, 0.5) and (0.6, 0.95)
sgE1 <- guesst(d = c(0.2, 0.5), p = c(0.6, 0.95), "sigEmax")
# local approach
sgE2 <- guesst(d = c(0.2, 0.5), p = c(0.6, 0.95), "sigEmax",
               local = TRUE, Maxd = 1)
models <- list(sigEmax = matrix(c(sgE1, sgE2), byrow = TRUE, nrow = 2))
plotModels(models, c(0,1), base= 0, maxEff = 1)

# Quadratic model
# For the quadratic model it is assumed that the maximum effect occurs at 
# dose 0.7
quad <- guesst(d = 0.7, p = 1, "quadratic")
models <- list(quadratic = quad)
plotModels(models, c(0,1), base= 0, maxEff = 1)

# exponential model
# (d,p) = (0.8,0.5)
expo <- guesst(d = 0.8, p = 0.5, "exponential", Maxd=1)
models <- list(exponential = expo)
plotModels(models, c(0,1), base= 0, maxEff = 1)



