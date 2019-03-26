library(MsdeParEst)


### Name: msde.sim
### Title: Simulation Of A Mixed Stochastic Differential Equation
### Aliases: msde.sim

### ** Examples


 
 # Example 1 : one random effect in the drift and one fixed effect in the diffusion coefficient
 sim <- msde.sim(M = 30, T = 1, N = 1000, model = 'OU', drift.random = 2,
                diffusion.random = 0, drift.param = c(0,1,sqrt(0.4/4)), diffusion.param = 0.5)
                
 # Example 2 : two random effects in the drift and one random effect in the diffusion coefficient

 sim <- msde.sim(M = 30, T = 1, N = 1000, model = 'OU', drift.random = c(1,2),
                diffusion.random = 1, drift.param = c(1,0.5,0.5,0.5), diffusion.param = c(8,1/2))
          
 # Example 3 : one fixed effect and one mixture random effect in the drift, and one fixed effect in
 # the diffusion coefficient
 
 sim <- msde.sim(M = 30, T = 1, N = 1000, model = 'OU', 
                 drift.random = 1, drift.param = 
                 matrix(c(0.5,1.8,0.25,0.25,1,1),nrow=2,byrow=FALSE),
                 diffusion.random = 0, diffusion.param = 0.1, 
                 nb.mixt = 2, mixt.prop = c(0.5,0.5))
                 
# Example 4 : CIR with one random effect in the drift and one random effect in the diffusion 
# coefficient

sim <- msde.sim(M = 30, T = 1, N = 1000, model = 'CIR', drift.random = 2,
                diffusion.random = 1, drift.param = c(4,1,0.1), diffusion.param = c(8,0.5),
                X0 = 1)
 




