library(OneArmPhaseTwoStudy)


### Name: getD_none
### Title: Get the conditional errors.
### Aliases: getD_none

### ** Examples

#Calculate a Simon's two-stage design
design <- getSolutions()$Solutions[3,] #minimax-design for the default values.

ce_toOne <- getD_none(design)
ce_toOne



