library(Jdmbs)


### Name: jdm_bs
### Title: A Monte Carlo Option Pricing Algorithm for Jump Diffusion Model
### Aliases: jdm_bs

### ** Examples

price <- jdm_bs(3 ,simulation.length=100,monte_carlo=80,
               c(1000,500,500), c(0.002, 0.015, 0.01),
               c(0.08,0.04,0.06), 3, c(0.1,0.1,0.1),
               c(1300,600,700), c("red","blue","green")
               )



