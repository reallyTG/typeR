library(prob)


### Name: prob
### Title: Probability and Conditional Probability
### Aliases: prob Prob Prob.default Prob.ps
### Keywords: misc

### ** Examples

S <- rolldie(times = 3, makespace = TRUE )
Prob(S, X1+X2 > 9 )
Prob(S, X1+X2 > 9, given = X1+X2+X3 > 7 )



