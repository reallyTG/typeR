library(OneArmPhaseTwoStudy)


### Name: get_conditionalPower
### Title: Calculates the conditional power.
### Aliases: get_conditionalPower

### ** Examples

#Setup "sub1"-object
sub1 <- setupSub1Design(pc0 = 0.5, pt0 = 0.6)

#Calculate a  subset design
design <- getSolutionsSub1(sub1, skipN1 = FALSE)$Solutions[4,]

t <- 5
u <- 7
enrolled <- 10

con_p <- get_conditionalPower(t, u, enrolled, design$r1,
design$n1, design$r, design$s, design$n, design$pc1, design$pt1, sub1)



