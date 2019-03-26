library(popdemo)


### Name: reac
### Title: Calculate reactivity and first-timestep attenuation
### Aliases: reac

### ** Examples

  # Create a 3x3 PPM
  ( A <- matrix(c(0,1,2,0.5,0.1,0,0,0.6,0.6), byrow=TRUE, ncol=3) )

  # Create initial stage structures
  ( initial1 <- c(1,3,2) )
  ( initial2 <- c(3,1,1) )

  # Calculate the upper bound on reactivity of A
  reac(A, bound="upper")

  # Calculate the lower bound on first-timestep attenuation of A
  reac(A, bound="lower")

  # Calculate case-specific reactivity of A
  # when projected using specific demographic structure
  # that amplifies
  reac(A, vector=initial1)

  # Calculate case-specific reactivity of A
  # and initial1 and return realised population size
  reac(A, vector=initial1, return.N=TRUE)

  # Calculate case-specific first-timestep attenuation of A 
  # when projected using a specific demographic structure that
  #attenuates
  reac(A, vector=initial2)

  # Calculate case-specific first-timestep attenuation of A 
  # and initial2 and return realised population size
  reac(A, vector=initial2, return.N=TRUE)#'




