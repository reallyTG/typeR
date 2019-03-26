library(elections)


### Name: eldat
### Title: Outcomes of the USA presidential elections since 1920, and
###   various predictors
### Aliases: eldat
### Keywords: datasets

### ** Examples


#Example 1: fit model for probability that the winner is a republican,
#using only the outcomes of the last two elections.

#Load data
data(eldat)

#Fit model for probability that the winner is a republican
elmod <- glm(winnerparty == "Rep." ~ winnerparty.tmin1*winnerparty.tmin2,
data = eldat, family = binomial(link = logit))
summary(elmod)
#ok, coefficients clearly illustrate "pendulum" effect,
#don't mind the p-values because of small sample size

#Prediction from elmod, with cutoff 0.5
eldat$p.elmod <- predict.glm(elmod, type = "response") #predicted probability
eldat$pred.elmod <- ifelse(eldat$p.elmod > 0.5, "Rep.", "Dem.") #predicted outcome
with(eldat, table(pred.elmod, winnerparty)) #crosstable
100*sum(with(eldat, winnerparty == pred.elmod))/nrow(eldat) #% correctly predicted
#76% correct
#indicator wrong/right prediction
eldat$ind.elmod <- with(eldat, ifelse(winnerparty == pred.elmod, "OK", "WRONG!"))
#show prediction	
eldat[, c("electionyear", "winner", "winnerparty", "pred.elmod", "p.elmod", "ind.elmod")]

#25-fold crossvalidation with 1-24 split
#(leave out one, fit model, predict for the observation left out)
eldat$p.elmod.CV <- NA #predicted cross-validated probability (first fill with NAs)
for(i in 1:25){
tempmod <- glm(winnerparty == "Rep." ~ winnerparty.tmin1*winnerparty.tmin2,
data = eldat[-i,], family = binomial(link = logit)) #fit model on training data
eldat$p.elmod.CV[i] <- predict.glm(tempmod, type = "response", newdata = eldat[i,])[[1]]
#predicted probability for test data
}

#Evaluate the predictions from the crossvalidation
eldat$pred.elmod.CV <- ifelse(eldat$p.elmod.CV > 0.5, "Rep.", "Dem.") #predicted outcome
with(eldat, table(pred.elmod.CV, winnerparty)) #crosstable
100*sum(with(eldat, winnerparty == pred.elmod.CV))/nrow(eldat) #% correctly predicted
#still 76% correct
eldat$ind.elmod.CV <- with(eldat, ifelse(winnerparty == pred.elmod.CV, "OK", "WRONG!"))
eldat[,c("electionyear", "winner", "winnerparty", "pred.elmod.CV", "p.elmod.CV", "ind.elmod.CV")]

#Overview
100*sum(with(eldat, winnerparty == pred.elmod))/nrow(eldat) #Without CV: 76% correct
100*sum(with(eldat, winnerparty == pred.elmod.CV))/nrow(eldat) #With CV: 76% correct




