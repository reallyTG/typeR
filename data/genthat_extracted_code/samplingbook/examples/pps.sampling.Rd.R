library(samplingbook)


### Name: pps.sampling
### Title: Sampling with Probabilities Proportional to Size
### Aliases: pps.sampling

### ** Examples

## 1) simple suppositious example
data <- data.frame(id = 1:7, z = c(1.8, 2 ,3.2 ,2.9 ,1.5 ,2.0 ,2.2))
# Usage of pps.sampling for Sampford method
set.seed(178209)
pps.sample_sampford <- pps.sampling(z=data$z, n=2, method='sampford', return.PI=FALSE)
pps.sample_sampford
# sampling elements
id.sample <- pps.sample_sampford$sample
id.sample
# other methods
set.seed(178209)
pps.sample_tille <- pps.sampling(z=data$z, n=2, method='tille')
pps.sample_tille
set.seed(178209)
pps.sample_midzuno <- pps.sampling(z=data$z, n=2, method='midzuno')
pps.sample_midzuno
set.seed(178209)
pps.sample_madow <- pps.sampling(z=data$z, n=2, method='madow')
pps.sample_madow

## 2) influenza
data(influenza)
summary(influenza)

set.seed(108506)
pps <- pps.sampling(z=influenza$population,n=20,method='midzuno')
pps
sample <- influenza[pps$sample,]
sample



