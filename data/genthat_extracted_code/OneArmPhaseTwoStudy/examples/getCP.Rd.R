library(OneArmPhaseTwoStudy)


### Name: getCP
### Title: Calculates the conditional power.
### Aliases: getCP

### ** Examples

#Calculate a Simon's two-stage design
design <- getSolutions()$Solutions[3,] #minimax-design for the default values.

#Assume 3 responses were observed in the interim analysis.
#Therefore the conditional power is only about 0.55.
#In order to raise the conditional power to 0.8 "n2" has to be increased.

#get the current "n2"
n2 <- design$n - design$n1

#set k to 3 (only 3 responses observed so far)
k = 3

#get the current conditional power
cp <- getCP(n2, design$p1, design, k, mode = 1, alpha = 0.05)
cp

## No test: 
#increase n2 until the conditional power is larger than 0.8
while(cp < 0.8){
n2 <- n2 + 1
# Assume we spent the "rest alpha" proportionally (in the planning phase)
# therefore we set "mode = 1".
cp <- getCP(n2, design$p1, design, k, mode = 1, alpha = 0.05)
}

n2
## End(No test)



