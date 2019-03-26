library(OneArmPhaseTwoStudy)


### Name: getSolutions
### Title: Returns designs for a given "simon"-object (see 'setupSimon')
### Aliases: getSolutions

### ** Examples

# Example 1: Using the default values
designs <- getSolutions()
designs <- designs$Solutions
designs
## No test: 
# Example 2: Setting up a "simon"-object, then calculate designs
simon <- setupSimon(alpha = 0.1, beta = 0.2, p0 = 0.3, p1 = 0.5)
designs <- getSolutions(simon)$Solutions
designs

# Esample 3: Calculating designs and simulating the influence of
# stochastic curtailment for each design.
simon <- setupSimon(alpha = 0.1, beta = 0.2, p0 = 0.3, p1 = 0.5)
designs <- getSolutions(simon, useCurtailment = TRUE, curtail_All = TRUE, cut = 0.3)
#List containing the found designs, the influence of stochastic curtailment
# and the regarding stopping rules.
designs
## End(No test)



