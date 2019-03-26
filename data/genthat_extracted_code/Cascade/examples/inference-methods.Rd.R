library(Cascade)


### Name: inference
### Title: Reverse-engineer the network
### Aliases: inference inference-methods inference,micro_array-method
### Keywords: methods

### ** Examples

## No test: 
#With simulated data
data(simul)
infM <- inference(M)
str(infM)

#With selection of genes from GSE39411
data(Selection)
infSel <- inference(Selection)
str(infSel)
## End(No test)



