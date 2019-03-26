library(EEM)


### Name: prcompname
### Title: Create name for prcomp result
### Aliases: prcompname

### ** Examples

data(applejuice)
applejuice_uf <- unfold(applejuice) # unfold list into matrix
result <- prcomp(applejuice_uf) 
prcompname(result, 1)




