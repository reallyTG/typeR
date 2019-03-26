library(ReliabilityTheory)


### Name: maskedInferenceIIDExponential
### Title: Inference for Masked iid System Lifetimes, Exponential
###   Components
### Aliases: maskedInferenceIIDExponential
### Keywords: masked system lifetime model Exponential iid bayesian
###   inference data augmentation signature

### ** Examples

# Some masked system lifetime data for a system with Exponential component
# lifetime, rate=3.14
t <- c(0.2696, 0.3613, 0.0256, 0.1287, 0.2305, 0.1565, 0.2484, 0.7482, 
0.1748, 0.1805, 0.1985, 0.0799, 0.2843, 0.2392, 0.2151, 0.1177, 
0.1278, 0.4189, 0.4374, 0.0931, 0.2846, 0.0357, 0.1809, 0.2077, 
0.5211, 0.4935, 0.1464, 0.0297, 0.5429, 0.1294, 0.7089, 0.5534, 
0.1183, 0.2628, 0.0481, 0.0518, 0.0533, 0.3595, 0.0767, 0.2606, 
0.1005, 0.227, 0.01, 0.0947, 0.1248, 0.2288, 0.1422, 0.233, 0.1428, 
0.2043)

# Load the signatures of order 4 simply connected coherent systems -- the data
# above correspond to simulations from system number 3
data(sccsO4)

# Perform inference on the rate parameter:
## Not run: 
##D samps <- maskedInferenceIIDExponential(t, sccsO4[[3]]$signature, 2000,
##D priorShape=9, priorScale=0.5)
## End(Not run)

# Or perform inference on rate parameter and topology jointly, taking as candidate
# set all possible simply connected coherent systems of order 4:
## Not run: 
##D samps <- maskedInferenceIIDExponential(t, sccsO4, 2000, priorShape=9,
##D priorScale=0.5)
## End(Not run)



