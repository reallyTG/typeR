library(BoolNet)


### Name: testNetworkProperties
### Title: Test properties of networks by comparing them to random networks
### Aliases: testNetworkProperties testIndegree testAttractorRobustness
###   testTransitionRobustness
### Keywords: robustness analysis perturbation in-degree

### ** Examples

# load mammalian cell cycle network
data(cellcycle)

if (interactive())
# do not run these examples in the package check, as they take some time
{
  # compare the in-degrees of the states in the
  # cell cycle network to random networks
  testNetworkProperties(cellcycle, testFunction="testIndegree", alternative="greater")

  # compare the in-degrees of the states in the
  # cell cycle network to random networks,
  # and plot the Kullback-Leibler distances of the 100 experiments
  testNetworkProperties(cellcycle, testFunction="testIndegree",
                        accumulation = "kullback_leibler")

  # compare the robustness of attractors in the cell cycle network
  # to random networks by perturbing the networks
  testNetworkProperties(cellcycle, testFunction="testAttractorRobustness",
                        testFunctionParams=list(perturb="functions", numSamples=10),
                        alternative="greater")

  # compare the robustness of attractors in the cell cycle network
  # to random networks by perturbing the state trajectories
  testNetworkProperties(cellcycle, testFunction="testAttractorRobustness",
                        testFunctionParams=list(perturb="trajectories", numSamples=10),
                        alternative="greater")
                      
  # compare the robustness of single state transitions in the cell cycle network
  testNetworkProperties(cellcycle, testFunction="testTransitionRobustness",
                        testFunctionParams=list(numSamples=10),
                        alternative="less")
}                     



