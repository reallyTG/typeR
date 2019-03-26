library(elect)


### Name: elect
### Title: State-specific and marginal life expectancies
### Aliases: elect

### ** Examples

# Fit msm model:
Q     <- rbind(c(0,0.01,0.01), c(0,0,0.01), c(0,0,0))
model <- msm(state~age, subject = id, data = ELECTData,
             center = FALSE, qmatrix = Q, death = TRUE,
             covariates = ~age+x)

# Estimate life expectancies:
sddata <- ELECTData[ELECTData$bsline == 1,]
LEs    <- elect(x = model, b.covariates = list(age = 0, x = 0),
                statedistdata = sddata, h = 0.5, age.max = 50, S = 25)
summary(LEs)
plot(LEs)     # For smoother graphs, increase S



