library(adiv)


### Name: rare_Rao
### Title: Functional Rarefaction for Species Abundance Data
### Aliases: rare_Rao
### Keywords: models

### ** Examples

data(aviurba, package="ade4")
distances<-dist.ktab(ktab.list.df(list(aviurba$traits)), type = "N")
# The distances should be squared Euclidean; 
# note that Euclidean distances can be used 
# as they also are squared Euclidean.

abundances<- aviurba$fau
rare_Rao(abundances, distances, sim = TRUE, resampling = 100)
rare_Rao(abundances, distances, sim = FALSE)



