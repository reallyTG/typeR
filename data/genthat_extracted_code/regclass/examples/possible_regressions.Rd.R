library(regclass)


### Name: possible_regressions
### Title: Illustrating how a simple linear/logistic regression could have
###   turned out via permutations
### Aliases: possible.regressions possible_regressions

### ** Examples

  
  #A weak but statistically significant relationship
  data(TIPS)
  M <- lm(TipPercentage~Bill,data=TIPS)
  possible_regressions(M)
  
  #A very strong relationship
  data(SURVEY10)
  M <- lm(PercMoreIntelligentThan~PercMoreAttractiveThan,data=SURVEY10)
  possible_regressions(M,permutations=1000)

  #Show raw SSE instead of reductions
  M <- lm(TipPercentage~PartySize,data=TIPS)
  possible_regressions(M,reduction=FALSE)
	 


