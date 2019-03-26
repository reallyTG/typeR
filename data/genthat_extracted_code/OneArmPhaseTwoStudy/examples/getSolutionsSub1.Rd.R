library(OneArmPhaseTwoStudy)


### Name: getSolutionsSub1
### Title: Calculates designs for a given "sub1"-object.
### Aliases: getSolutionsSub1

### ** Examples

# Example 1: Using the default values
sub1 <- setupSub1Design()
getSolutionsSub1(sub1)
## No test: 
# Example 2: Setting up a "sub1"-object, then calculating designs
sub1 <- setupSub1Design(alpha = 0.1, beta = 0.2, pc0 = 0.3, pt0 = 0.4)
designs <- getSolutionsSub1(sub1)$Solutions
designs

# Example 2: Calculating designs and simulating the influence of stochastic curtailment
# for each design.
sub1 <- setupSub1Design(alpha = 0.1, beta = 0.2, pc0 = 0.3, pt0 = 0.4)
designs <- getSolutionsSub1(sub1, useCurtailment = TRUE, curtailAll = TRUE, cut = 0.3)
#Contains the found designs, the influence of stochastic curtailment
#and the regarding stopping rules .
designs
## End(No test)



