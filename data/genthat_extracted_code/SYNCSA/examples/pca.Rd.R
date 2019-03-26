library(SYNCSA)


### Name: pca
### Title: Principal Components Analysis (PCA) with NA (missing data)
### Aliases: pca print.pcasyncsa plot.pcasyncsa
### Keywords: SYNCSA

### ** Examples

data(ADRS)
traits<-ADRS$traits
# Some NA
traits[c(1,5),1]<-NA
traits[3,2]<-NA
traits
res<-pca(traits)
res
plot(res, show = "variables", arrows = TRUE)
plot(res, show = "individuals", axis = c(1, 2), text = TRUE)
plot(res, show = "individuals", text = FALSE, points = TRUE)



