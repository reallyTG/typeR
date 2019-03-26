library(OneArmPhaseTwoStudy)


### Name: get_p_exact_subset
### Title: Calculates the exact p value.
### Aliases: get_p_exact_subset

### ** Examples

#Setup "sub1"-object
sub1 <- setupSub1Design(pc0 = 0.5, pt0 = 0.6)

#Calculate a  subset design
design <- getSolutionsSub1(sub1, skipN1 = FALSE)$Solutions[4,]

#Assuming 9 responses in the subset endpoint and 13 responses
#in the superset endpoint were observed.
t = 9
u = 13

p_val <- get_p_exact_subset(t, u, design$r1, design$n1, design$n, design$pc0, design$pt0, sub1)
p_val



