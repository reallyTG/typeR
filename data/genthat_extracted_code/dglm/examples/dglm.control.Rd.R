library(dglm)


### Name: dglm.control
### Title: Auxiliary for controlling double glm fitting
### Aliases: dglm.control
### Keywords: optimize models

### ** Examples

### A variation on  example(dglm) :
# Continuing the example from  glm, but this time try
# fitting a Gamma double generalized linear model also.
clotting <- data.frame(
      u = c(5,10,15,20,30,40,60,80,100),
      lot1 = c(118,58,42,35,27,25,21,19,18),
      lot2 = c(69,35,26,21,18,16,13,12,12))
         
# The same example as in  glm: the dispersion is modelled as constant
out <- dglm(lot1 ~ log(u), ~1, data=clotting, family=Gamma)
summary(out)

# Try a double glm 
oo <- options()
options(digits=12) # See more details in tracing
out2 <- dglm(lot1 ~ log(u), ~u, data=clotting, family=Gamma,
   control=dglm.control(epsilon=0.01, trace=TRUE))
   # With this value of epsilon, convergence should be quicker
   # and the results less reliable (compare to example(dglm) )

summary(out2)
options(oo)



