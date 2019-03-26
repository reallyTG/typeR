library(ReliabilityTheory)


### Name: maskedInferenceEXCHExponential
### Title: Inference for Masked Exchangeable System Lifetimes, Exponential
###   Components
### Aliases: maskedInferenceEXCHExponential
### Keywords: masked system lifetime model Exponential exchangeable
###   bayesian inference data augmentation signature

### ** Examples

# Some masked system lifetime data for an exchangeable collection of systems with
# Exponential component lifetime, rate drawn from the population distribution
# Gamma(shape=9, scale=0.5)
t <- c(0.2265, 0.0795, 0.1178, 0.2463, 0.1053, 0.0982, 0.0349, 0.0363, 
0.1546, 0.1357, 0.1239, 0.0354, 0.0124, 0.1003, 0.0827, 0.2446, 
0.1214, 0.1272, 0.5438, 0.2738, 0.0378, 0.2293, 0.1706, 0.0146, 
0.1506, 0.3665, 0.046, 0.1196, 0.2724, 0.2593, 0.0438, 0.1493, 
0.0697, 0.1774, 0.1157, 0.0996, 0.2815, 0.1411, 0.0921, 0.2088, 
0.1164, 0.149, 0.048, 0.1019, 0.2349, 0.2211, 0.0475, 0.0721, 
0.0371, 0.611, 0.1959, 0.0666, 0.0956, 0.1416, 0.2126, 0.0104, 
0.088, 0.0159, 0.078, 0.1747, 0.1921, 0.3558, 0.4956, 0.0436, 
0.2292, 0.1159, 0.1201, 0.1299, 0.043, 0.0584, 0.0347, 0.2084, 
0.1334, 0.1491, 0.0384, 0.0589, 0.2962, 0.1023, 0.0506, 0.0501, 
0.1859, 0.0714, 0.1424, 0.0027, 0.2812, 0.0318, 0.4147, 0.1088, 
0.2894, 0.0734, 0.1405, 0.0367, 0.0323, 0.517, 0.1034, 0.026, 
0.0485, 0.0512, 0.0116, 0.1629)

# Load the signatures of order 4 simply connected coherent systems -- the data
# above correspond to simulations from system number 3
data(sccsO4)

# Perform inference on the rate parameter:
## Not run: 
##D samps <- maskedInferenceEXCHExponential(t, sccsO4[[3]]$signature, 
##D 2000, priorMu_Mu=1, priorSigma_Mu=0.5, priorMu_Sigma=1, priorSigma_Sigma=0.7)
## End(Not run)

# Or perform inference on rate parameter and topology jointly, taking as candidate
# set all possible simply connected coherent systems of order 4:
## Not run: 
##D samps <- maskedInferenceEXCHExponential(t, sccsO4, 2000, priorMu_Mu=1,
##D priorSigma_Mu=0.5, priorMu_Sigma=1, priorSigma_Sigma=0.7)
## End(Not run)



