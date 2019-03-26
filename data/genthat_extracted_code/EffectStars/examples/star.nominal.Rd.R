library(EffectStars)


### Name: star.nominal
### Title: Effect stars for multinomial logit models
### Aliases: star.nominal
### Keywords: multinomial logit model star plot multinomial response

### ** Examples

## Not run: 
##D data(election)
##D 
##D # simple multinomial logit model
##D star.nominal(Partychoice ~ Age + Religion + Democracy + Pol.Interest + 
##D                  Unemployment + Highschool + Union + West + Gender, election)
##D 
##D # Use effect coding for the categorical predictor religion
##D star.nominal(Partychoice ~ Age + Religion + Democracy + Pol.Interest + 
##D                  Unemployment + Highschool + Union + West + Gender, election,
##D                  pred.coding = "effect")                 
##D 
##D # Use reference category "FDP" instead of symmetric side constraints
##D star.nominal(Partychoice ~ Age + Religion + Democracy + Pol.Interest + 
##D                  Unemployment + Highschool + Union + West + Gender, election,
##D                  refLevel = 3, symmetric = FALSE)
##D                  
##D # Use category-specific covariates, subtract values for reference 
##D # category CDU
##D election[,13:16] <- election[,13:16] - election[,12]
##D election[,18:21] <- election[,18:21] - election[,17]
##D election[,23:26] <- election[,23:26] - election[,22]
##D election[,28:31] <- election[,28:31] - election[,27]
##D 
##D election$Social <- election$Social_SPD
##D election$Immigration <- election$Immigration_SPD
##D election$Nuclear <- election$Nuclear_SPD
##D election$Left_Right <- election$Left_Right_SPD
##D 
##D star.nominal(Partychoice ~ Social + Immigration + Nuclear + Left_Right + Age + 
##D Religion + Democracy + Pol.Interest + Unemployment + Highschool + Union + West + 
##D Gender, data = election, 
##D xij = list(Social ~ Social_SPD + Social_FDP + Social_Greens + Social_Left,
##D Immigration ~ Immigration_SPD + Immigration_FDP + Immigration_Greens + Immigration_Left,
##D Nuclear ~ Nuclear_SPD + Nuclear_FDP + Nuclear_Greens + Nuclear_Left,
##D Left_Right ~ Left_Right_SPD + Left_Right_FDP + Left_Right_Greens + Left_Right_Left),
##D symmetric = FALSE)
## End(Not run)



