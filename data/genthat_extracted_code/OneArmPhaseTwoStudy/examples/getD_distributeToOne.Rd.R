library(OneArmPhaseTwoStudy)


### Name: getD_distributeToOne
### Title: Get the conditional errors.
### Aliases: getD_distributeToOne

### ** Examples

#Calculate a Simon's two-stage design
design <- getSolutions()$Solutions[3,] #minimax-design for the default values.

ce_toOne <- getD_distributeToOne(design, 0.05)
ce_toOne



