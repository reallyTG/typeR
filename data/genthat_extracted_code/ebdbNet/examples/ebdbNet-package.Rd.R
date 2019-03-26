library(ebdbNet)


### Name: ebdbNet-package
### Title: Empirical Bayes Dynamic Bayesian Network (EBDBN) Inference
### Aliases: ebdbNet-package ebdbNet
### Keywords: package

### ** Examples

library(ebdbNet)
library(GeneNet)  ## Load GeneNet package to use T-cell activation data
tmp <- runif(1) ## Initialize random number generator
set.seed(4568818) ## Set seed

## Load T-cell activation data
data(tcell) 
tc44 <- combine.longitudinal(tcell.10, tcell.34)

## Put data into correct format for algorithm
## (List, with one matrix per replicate (P rows and T columns)
tcell.dat <- dataFormat(tc44)

## Use only subset of T-cell data for faster example
R <- 20 ## 20 replicates
P <- 10 ## 10 genes
tcell.sub.dat <- vector("list", R)
rep.sample <- sample(1:44, R)
for(r in 1:R) {
	tcell.sub.dat[[r]] <- tcell.dat[[rep.sample[r]]][sample(1:58, P),]
}

####################################################
# Run EBDBN (no hidden states) with feedback loops
####################################################
## Choose alternative value of K using hankel if hidden states to be estimated
## K <- hankel(tcell.sub.dat, lag = 1)$dim

## Run algorithm (feedback network, no hidden states)
net <- ebdbn(y = tcell.sub.dat, K = 0, input = "feedback", conv.1 = 0.01,
	conv.2 = 0.01, conv.3 = 0.001, verbose = TRUE)

## Visualize results: in this example, mostly feedback loops
## plot(net, sig.level = 0.5)



