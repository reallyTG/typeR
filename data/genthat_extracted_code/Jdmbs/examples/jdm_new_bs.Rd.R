library(Jdmbs)


### Name: jdm_new_bs
### Title: A Monte Carlo Option Pricing Algorithm for Jump Diffusion Model
###   with Correlation Companies
### Aliases: jdm_new_bs

### ** Examples

price <- jdm_new_bs(matrix(c(0.1,0.2,0.3,0.4,0.5,0.6,0.7,0.8,0.9),nrow=3, ncol=3),
                    3, simulation.length=100,monte_carlo=80, c(1000,500,500),
                    c(0.002, 0.012, 0.005),c(0.05,0.05,0.06), 3,c(0.1,0.1,0.1),
                    c(1500,1000,700),c("red","blue","green")
                   )



