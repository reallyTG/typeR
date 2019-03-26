library(EEM)


### Name: fold
### Title: Fold EEM matrix into a list
### Aliases: fold fold.data.frame fold.matrix fold.numeric

### ** Examples

data(applejuice)
applejuice_uf <- unfold(applejuice) # unfold list into matrix
applejuice_uf_norm <- normalize(applejuice_uf) # normalize matrix
drawEEM(fold(applejuice_uf_norm), 1) # visualize normalized EEM




