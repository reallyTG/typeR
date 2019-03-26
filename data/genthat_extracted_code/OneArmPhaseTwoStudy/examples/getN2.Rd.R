library(OneArmPhaseTwoStudy)


### Name: getN2
### Title: Calculates the number of patients which should be enrolled in
###   the second stage.
### Aliases: getN2

### ** Examples

#Calculate a Simon's two-stage design
design <- getSolutions()$Solutions[3,] #minimax-design for the default values.

#Assume we only observed 3 responses in the interim analysis.
#Therefore the conditional power is only about 0.55.
#In order to raise the conditional power to 0.8 "n2" has to be increased.

#set k to 3 (only 3 responses observed so far)
k = 3

# Assume we spent the "rest alpha" proportionally in the planning phase
# there for we set "mode = 1".
n2 <- getN2(cp = 0.8, design$p1, design, k, mode = 1, alpha = 0.05)
n2



