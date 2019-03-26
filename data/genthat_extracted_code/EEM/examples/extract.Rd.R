library(EEM)


### Name: extract
### Title: Extract values from other models
### Aliases: extract getLoading getReg

### ** Examples

data(applejuice)
applejuice_uf <- unfold(applejuice) # unfold list into matrix
result <- prcomp(applejuice_uf) 
loading <- getLoading(result)
str(loading)



