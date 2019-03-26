library(canprot)


### Name: get_comptab
### Title: Calculate Compositional Differences
### Aliases: get_comptab

### ** Examples

data(canprot)
pd <- get_pdat("JKMF10")
# default variables: ZC and nH2O
get_comptab(pd, plot.it = TRUE)
# protein length and per-residue volume
get_comptab(pd, "nAA", "V0", plot.it = TRUE)



