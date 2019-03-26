library(OneArmPhaseTwoStudy)


### Name: get_confidence_set
### Title: Calculates the confidence set.
### Aliases: get_confidence_set

### ** Examples

#Setup "sub1"-object
sub1 <- setupSub1Design(pc0 = 0.5, pt0 = 0.6)

#Calculate a  subset design
design <- getSolutionsSub1(sub1, skipN1 = FALSE)$Solutions[4,]

t <- 12
u <- 13
alpha = 0.1

conf_set <- get_confidence_set(t, u, design$r1, design$n1, design$n, design$pc0, design$pt0, alpha)



