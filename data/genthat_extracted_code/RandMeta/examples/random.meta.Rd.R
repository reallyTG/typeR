library(RandMeta)


### Name: random.meta
### Title: Exact Inference for Meta Analysis With Random Effects Model
### Aliases: random.meta
### Keywords: Exact Inference Meta Analysis Random Effect

### ** Examples

##### Generate the data for a meta analysis with 8 studies #####
set.seed(100)
K=8
tau=2
v=rchisq(K, 3)
y=rnorm(K)*sqrt(v+tau)+1

##### Exact inference using the DL method #####
fit=random.meta(y, v, type="DL")
fit

##### Exact inference using the Wilcoxon method #####
fit=random.meta(y, v, type="wilcox")
fit






