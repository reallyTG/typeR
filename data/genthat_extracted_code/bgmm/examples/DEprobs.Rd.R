library(bgmm)


### Name: DEprobs
### Title: Signed probabilities of differential expression
### Aliases: DEprobs

### ** Examples

data(Ste12)
X = Ste12Data[ match(names(Ste12Data), rownames(Ste12Beliefs), nomatch = 0) ==0 ]
knowns = Ste12Data[rownames(Ste12Beliefs)]
model = belief(X=X, knowns=knowns, B=Ste12Beliefs)
dep=DEprobs(model)
str(dep)



