library(OneArmPhaseTwoStudy)


### Name: plot_simon_study_state
### Title: Plots the study state of a given Simon's two-stage design.
### Aliases: plot_simon_study_state

### ** Examples

#Calculate a Simon's two-stage design
design <- getSolutions()$Solutions[3,] #minimax-design for the default values.
#Define the stopping rules according to the chosen design
sr <- data.frame(Enrolled_patients = c(design$n1, design$n),
Needed_responses_ep1 = c(design$r1, design$r))
#Simulate 18 random generated outcomes.
enrolledPat <- data.frame(ep1 = rbinom(18,1, design$p1))
#Plot study state
plot_simon_study_state(sr, enrolledPat, design$r1, design$n1, design$r, design$n)



