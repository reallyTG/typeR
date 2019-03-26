library(lfe)


### Name: efactory
### Title: Create estimable function
### Aliases: efactory

### ** Examples


oldopts <- options(lfe.threads=1)
id <- factor(sample(5000,50000,replace=TRUE))
firm <- factor(sample(3000,50000,replace=TRUE))
fl <- list(id=id,firm=firm)
obj <- list(fe=fl,cfactor=compfactor(fl))
## the trivial least-norm  transformtion, which by the way is non-estimable
print(ef <- efactory(obj,'ln'))
is.estimable(ef,fl)
## then the default
print(ef <- efactory(obj,'ref'))
is.estimable(ef,fl)
# get the names of the coefficients, i.e. the nm-variable in the function
head(evalq(nm,environment(ef)))
options(oldopts)




