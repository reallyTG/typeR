library(EMbC)


### Name: rlbl
### Title: Manual relabeling of clusters.
### Aliases: rlbl rlbl,binClst-method

### ** Examples

# -- apply EMbC to the example path --
mybcp <- stbc(expth,info=-1)
# -- manually merge clusters 1 and 2 --
rlbl(mybcp,1,2)
# -- reset to the original state --
rlbl(mybcp,reset=TRUE)



