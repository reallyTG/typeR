library(bootnet)


### Name: netSimulator
### Title: Network Estimation Performance
### Aliases: netSimulator replicationSimulator

### ** Examples

# 5-node GGM chain graph:
trueNetwork <- genGGM(5)

# Simulate:
Res <- netSimulator(trueNetwork, nReps = 10)

# Results:
Res

# Plot:
plot(Res)

## Not run: 
##D library("bootnet")
##D 
##D # BFI example:
##D # Load data:
##D library("psych")
##D data(bfi)
##D bfiData <- bfi[,1:25]
##D 
##D # Estimate a network structure, with parameters refitted without LASSO regularization:
##D library("qgraph")
##D Network <- EBICglasso(cor_auto(bfiData), nrow(bfiData), refit = TRUE)
##D 
##D # Simulate 100 repititions in 8 cores under different sampling levels:
##D Sim1 <- netSimulator(Network,
##D                      default = "EBICglasso",
##D                      nCases = c(100,250,500),
##D                      nReps = 100,
##D                      nCores = 8)
##D 
##D # Table of results:
##D Sim1
##D 
##D # Plot results:
##D plot(Sim1)
##D 
##D # Compare different default set at two sampling levels:
##D Sim2 <- netSimulator(Network,
##D                      default = c("EBICglasso","pcor","huge"),
##D                      nCases = c(100,250,500),
##D                      nReps = 100,
##D                      nCores = 8)
##D 
##D # Print results:
##D Sim2
##D 
##D # Plot results:
##D plot(Sim2, xfacet = "default", yvar = "correlation")
##D 
##D # Difference using polychoric or pearson correlations in ordinal data:
##D Sim3 <- netSimulator(Network,
##D                      dataGenerator = ggmGenerator(ordinal = TRUE, nLevels = 4),
##D                      default = "EBICglasso",
##D                      corMethod = c("cor","cor_auto"),
##D                      nCases = c(100,250, 500),
##D                      nReps = 100,
##D                      nCores = 8)
##D 
##D # Print results:
##D Sim3
##D 
##D # Plot results:
##D plot(Sim3, color = "corMethod")
##D 
##D # Ising model:
##D trueNetwork <- read.csv('http://sachaepskamp.com/files/weiadj.csv')[,-1]
##D trueNetwork <- as.matrix(trueNetwork)
##D Symptoms <- rownames(trueNetwork) <- colnames(trueNetwork)
##D Thresholds <- read.csv('http://sachaepskamp.com/files/thr.csv')[,-1]
##D 
##D # Create an input list (intercepts now needed)
##D input <- list(graph=trueNetwork,intercepts=Thresholds)
##D 
##D # Simulate under different sampling levels:
##D Sim4 <- netSimulator(
##D   input = input,
##D   default = "IsingFit",
##D   nCases = c(250,500,1000),
##D   nReps = 100,
##D   nCores = 8)
##D 
##D # Results:
##D Sim4
##D 
##D # Plot:
##D plot(Sim4)
##D 
##D # Compare AND and OR rule:
##D Sim5 <- netSimulator(
##D   input = input,
##D   default = "IsingFit",
##D   nCases = c(250,500,1000),
##D   rule = c("AND","OR"),
##D   nReps = 100,
##D   nCores = 8)
##D 
##D # Print:
##D Sim5
##D 
##D # Plot:
##D plot(Sim5, yfacet = "rule")
##D 
## End(Not run)



