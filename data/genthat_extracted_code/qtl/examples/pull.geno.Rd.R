library(qtl)


### Name: pull.geno
### Title: Pull out the genotype data from a cross
### Aliases: pull.geno
### Keywords: utilities

### ** Examples

data(listeria)
dat <- pull.geno(listeria)

# image of the genotype data
image(1:ncol(dat),1:nrow(dat),t(dat),ylab="Individuals",xlab="Markers",
      col=c("red","yellow","blue","green","violet"))
abline(v=cumsum(c(0,nmar(listeria)))+0.5)
abline(h=nrow(dat)+0.5)



