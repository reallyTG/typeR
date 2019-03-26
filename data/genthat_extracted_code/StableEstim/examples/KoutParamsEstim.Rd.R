library(StableEstim)


### Name: KoutParametersEstim
### Title: Iterative Koutrouvelis regression method
### Aliases: KoutParametersEstim
### Keywords: Estim-functions

### ** Examples

 pm=0
    theta <- c(1.45,0.5,1.1,0.4)
    set.seed(1235);x <- rstable(200,theta[1],theta[2],theta[3],theta[4],pm=pm)
    theta0=theta-0.1
    spacing="Kout"

    KoutParametersEstim(x=x,theta0=theta0,
                        spacing=spacing,pm=pm)



