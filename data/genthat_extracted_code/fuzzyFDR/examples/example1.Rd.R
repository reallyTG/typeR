library(fuzzyFDR)


### Name: example1
### Title: Examples 1 and 3 of Kulinskaya and Lewin
### Aliases: example1
### Keywords: datasets

### ** Examples

data(example1)
fuzzyBHexact(example1$pvals,example1$pprev,alpha=0.05)



