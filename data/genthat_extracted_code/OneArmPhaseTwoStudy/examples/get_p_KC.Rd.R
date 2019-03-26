library(OneArmPhaseTwoStudy)


### Name: get_p_KC
### Title: Calculates the p-value.
### Aliases: get_p_KC

### ** Examples

#Calculate a Simon's two-stage design
design <- getSolutions()$Solutions[3,] #minimax-design for the default values.

#Assume 9 responses were observed in the whole trial.
k = 9

p_val <- get_p_KC(k, design$r1, design$n1, design$n, design$p0)



