library(OneArmPhaseTwoStudy)


### Name: getD_proportionally
### Title: Get the conditional errors proportionally.
### Aliases: getD_proportionally

### ** Examples

#Calculate a Simon's two-stage design
design <- getSolutions()$Solutions[3,] #minimax-design for the default values.

ce_prop <- getD_proportionally(design, 0.05)
ce_prop



