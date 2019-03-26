library(bgmm)


### Name: init.model.params
### Title: Initiation of model parameters
### Aliases: init.model.params init.model.params.knowns

### ** Examples

 data(genotypes)
 initial.params = init.model.params(X=genotypes$X, knowns=genotypes$knowns,
									 class = genotypes$labels)
 str(initial.params)



