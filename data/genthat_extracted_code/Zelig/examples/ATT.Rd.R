library(Zelig)


### Name: ATT
### Title: Compute simulated (sample) average treatment effects on the
###   treated from a Zelig model estimation
### Aliases: ATT

### ** Examples

library(dplyr)
data(sanction)
z.att <- zelig(num ~ target + coop + mil, model = "poisson",
                 data = sanction) %>%
             ATT(treatment = "mil") %>%
             get_qi(qi = "ATT", xvalue = "TE")




