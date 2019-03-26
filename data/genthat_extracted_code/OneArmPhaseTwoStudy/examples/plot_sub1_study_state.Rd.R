library(OneArmPhaseTwoStudy)


### Name: plot_sub1_study_state
### Title: Plots the study state of a given subset design.
### Aliases: plot_sub1_study_state

### ** Examples

#Calculate a subset design.
sub1 <- setupSub1Design(alpha = 0.1, beta = 0.2, pc0 = 0.3, pt0 = 0.4)
design <- getSolutionsSub1(sub1)$Solutions[10,]
#Define the stopping rules according to the chosen design.
sr <- data.frame(Enrolled_patients = c(design$n1, design$n),
Needed_responses_ep1 = c(design$r1, design$r), Needed_responses_ep2 = c(0,design$s))
#Simulate 14 random generated outcomes.
tmp_ep1 <- rbinom(14,1, design$pc1)
tmp_ep2 <- tmp_ep1 | rbinom(14,1, design$pt1)
enrolledPat <- data.frame(ep1 = tmp_ep1, ep2 = tmp_ep2)
#Plot study state.
plot_sub1_study_state(sr, enrolledPat, design$r1, design$n1, design$r, design$s, design$n)



