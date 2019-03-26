library(svapls)


### Name: hfp
### Title: Function to construct a heatmap of the hidden variation in the
###   gene expression data.
### Aliases: hfp
### Keywords: print

### ** Examples

## Fitting the optimal ANCOVA model to the data gives:
data(hidden_fac.dat)
fit <- svpls(10,10,hidden_fac.dat,pmax = 5)

## Specifying the sets of genes and subjects
gen <- paste("g",c(1:15,50:65),sep="")
sub <- paste("S",c(1:5,11:17),sep="")

hfp(fit,gen,sub,hidden_fac.dat)



