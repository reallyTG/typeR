library(poliscidata)


### Name: pchisqC
### Title: Comparing Logistic Regression Models with Chi-Squared Test
### Aliases: pchisqC

### ** Examples

   library(poliscidata)
   
   obama_vote_model_reduced <- svyglm(obama_vote ~ ft_dem + white, design=nesD, 
                                      family="quasibinomial")
   obama_vote_model_full <- svyglm(obama_vote ~ ft_dem + white + (owngun_owngun=="1. Yes"), 
                                   design=nesD, family="quasibinomial")
   pchisqC(obama_vote_model_reduced, obama_vote_model_full)



