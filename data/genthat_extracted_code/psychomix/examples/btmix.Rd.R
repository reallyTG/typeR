library(psychomix)


### Name: btmix
### Title: Finite Mixtures of Bradley-Terry Models
### Aliases: btmix FLXMCbtreg
### Keywords: paired comparisons Bradley-Terry model mixture model

### ** Examples


## No test: 
## Data
data("GermanParties2009", package = "psychotools")

## omit single observation with education = 1
gp <- subset(GermanParties2009, education != "1")
gp$education <- factor(gp$education)

## Bradley-Terry mixture models
set.seed(1)
## fit models for k = 1, ..., 4 with concomitant variables
cm <- btmix(preference ~ gender + education + age + crisis,
  data = gp, k = 1:4, nrep = 3)

## inspect results
plot(cm)

## select model
cm4 <- getModel(cm, which = "4")

## inspect mixture and effects
library("lattice")
xyplot(cm4)
effectsplot(cm4)
effectsplot(cm4, selection = "education")

## vis effects package directly
if(require("effects")) {
eff4 <- allEffects(cm4)
plot(eff4)
}
## End(No test)




