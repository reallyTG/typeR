library(factoextra)


### Name: decathlon2
### Title: Athletes' performance in decathlon
### Aliases: decathlon2

### ** Examples

## No test: 
data(decathlon2)
decathlon.active <- decathlon2[1:23, 1:10]
res.pca <- prcomp(decathlon.active, scale = TRUE)
fviz_pca_biplot(res.pca)
## End(No test)




