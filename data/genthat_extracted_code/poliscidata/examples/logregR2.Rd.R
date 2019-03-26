library(poliscidata)


### Name: logregR2
### Title: Logistic regression model statistics
### Aliases: logregR2

### ** Examples

   library(poliscidata)
   obama_state_model <- glm(obama_win12 ~ secularism + gunlaw_rank, data=states, family=binomial)
   summary(obama_state_model)
   logregR2(obama_state_model)
   
   obama_vote_model <- svyglm(obama_vote ~ ft_dem, design=nesD, family="quasibinomial")
   summary(obama_vote_model)
   logregR2(obama_vote_model)



