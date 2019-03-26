library(OneArmPhaseTwoStudy)


### Name: getCP_simon
### Title: Returns the conditional power.
### Aliases: getCP_simon

### ** Examples

#Calculate a Simon's two-stage design
design <- getSolutions()$Solutions[3,] #minimax-design for the default values.
#Assume 3 out of 20 patients had a response.
getCP_simon(3,20,design$r1, design$n1, design$r, design$n, design$p1)



