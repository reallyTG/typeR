library(OneArmPhaseTwoStudy)


### Name: getD_equally
### Title: Get the conditional errors equally.
### Aliases: getD_equally

### ** Examples

#Calculate a Simon's two-stage design
design <- getSolutions()$Solutions[3,] #minimax-design for the default values.

ce_equally <- getD_equally(design, 0.05)
ce_equally



