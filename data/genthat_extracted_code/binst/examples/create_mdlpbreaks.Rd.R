library(binst)


### Name: create_mdlpbreaks
### Title: Create breaks using mdlp
### Aliases: create_mdlpbreaks

### ** Examples

entropy_breaks <- create_breaks(1:10, rep(c(1,2), each = 5), method="entropy")
create_bins(1:10, entropy_breaks)



