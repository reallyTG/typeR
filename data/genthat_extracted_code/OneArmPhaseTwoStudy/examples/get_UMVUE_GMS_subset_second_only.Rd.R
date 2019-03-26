library(OneArmPhaseTwoStudy)


### Name: get_UMVUE_GMS_subset_second_only
### Title: Calculates the "uniformly minimal variance unbiased estimator".
### Aliases: get_UMVUE_GMS_subset_second_only

### ** Examples

#Setup "sub1"-object
sub1 <- setupSub1Design(pc0 = 0.5, pt0 = 0.6)

#Calculate a subset design
design <- getSolutionsSub1(sub1, skipN1 = FALSE)$Solutions[4,]

#Assume 9 responses in the subset endpoint and 13 responses in the superset endpoint were observed.
t = 9
u = 13
umvue_second <- get_UMVUE_GMS_subset_second_only(t, u, design$r1, design$n1, design$n)



