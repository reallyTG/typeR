library(elect)


### Name: hazards
### Title: Age-dependent hazards based on a 'msm' model
### Aliases: hazards

### ** Examples

# Fit msm model:
Q     <- rbind(c(0,0.01,0.01), c(0,0,0.01), c(0,0,0))
model <- msm(state~age, subject = id, data = ELECTData,
             center = FALSE, qmatrix = Q, death = TRUE,
             covariates = ~age+x)
# Plot hazards on original age scale:
hazards(model, b.covariates = list(age = 0, x = 0),
        no.years = 20, max.haz = 0.25,  age.shift = -70)



