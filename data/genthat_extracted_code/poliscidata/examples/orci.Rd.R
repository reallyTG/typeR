library(poliscidata)


### Name: orci
### Title: Translate logistic regression coefficients into odds ratios
### Aliases: orci

### ** Examples

   library(poliscidata)
   obama_state_model <- glm(obama_win12 ~ secularism + gunlaw_rank, data=states, family=binomial)
   summary(obama_state_model)
   orci(obama_state_model)
   
   obama_vote_model <- svyglm(obama_vote ~ ft_dem, design=nesD, family="quasibinomial")
   summary(obama_vote_model)
   orci(obama_vote_model)



