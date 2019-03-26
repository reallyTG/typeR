library(EEM)


### Name: normalize
### Title: Normalize data
### Aliases: normalize

### ** Examples

data(applejuice)
applejuice_uf <- unfold(applejuice) # unfold list into matrix
applejuice_uf_norm <- normalize(applejuice_uf) # normalize data

rowSums(abs(applejuice_uf_norm), na.rm = TRUE) # the absolute sum of each row equal to 1

  



