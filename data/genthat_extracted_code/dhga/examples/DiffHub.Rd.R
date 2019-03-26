library(dhga)


### Name: DiffHub
### Title: Differential Hub status of the genes in a gene co-expression
###   network
### Aliases: DiffHub
### Keywords: gene co-expression network hub gene hub status level of
###   significance

### ** Examples

data(rice_salt)
data(rice_normal)
DiffHub(rice_salt,rice_normal,18,18,80, 6, alpha=0.0001, plot=TRUE)



