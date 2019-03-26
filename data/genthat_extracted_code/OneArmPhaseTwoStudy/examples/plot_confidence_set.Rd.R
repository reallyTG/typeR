library(OneArmPhaseTwoStudy)


### Name: plot_confidence_set
### Title: Plots the "confidence set" according to the observed responses.
### Aliases: plot_confidence_set

### ** Examples

#Setup "sub1"-object
sub1 <- setupSub1Design(pc0 = 0.5, pt0 = 0.6)

#Calculate a  subset design
design <- getSolutionsSub1(sub1, skipN1 = FALSE)$Solutions[4,]

#Assume 11 responses in the subset endpoint and 12 responses in the superset endpoint were observed.
t = 10
u = 12

plot_confidence_set(t, u, design$r1, design$n1, design$n, design$pc0, design$pt0, 0.1)



