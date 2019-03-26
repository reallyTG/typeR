library(OneArmPhaseTwoStudy)


### Name: get_UMVUE_GMS
### Title: Calculates the "uniformly minimal variance unbiased estimator".
### Aliases: get_UMVUE_GMS

### ** Examples

#Calculate a Simon's two-stage design
design <- getSolutions()$Solutions[3,] #minimax-design for the default values.

#Assume 9 responses were observed in the whole trial.
k = 9

umvue <- get_UMVUE_GMS(k, design$r1, design$n1, design$n)



