library(optmatch)


### Name: scores
### Title: Extract scores (propensity, prognostic,...) from a fitted model
### Aliases: scores

### ** Examples

data(nuclearplants)
pg <- lm(cost~., data=nuclearplants, subset=(pr==0))
# The following two lines produce identical results.
ps1 <- glm(pr~cap+date+t1+bw+predict(pg, newdata=nuclearplants),
           data=nuclearplants)
ps2 <- glm(pr~cap+date+t1+bw+scores(pg), data=nuclearplants)



