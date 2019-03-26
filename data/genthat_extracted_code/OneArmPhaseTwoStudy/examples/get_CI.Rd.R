library(OneArmPhaseTwoStudy)


### Name: get_CI
### Title: Calculates the confidence interval.
### Aliases: get_CI

### ** Examples

#Calculate a Simon's two-stage design
design <- getSolutions()$Solutions[3,] #minimax-design for the default values.

#Assume 9 responses were observed in the whole trial.
k = 9

ci <- get_CI(k, design$r1, design$n1, design$n)



