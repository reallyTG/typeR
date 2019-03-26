library(ade4)


### Name: morphosport
### Title: Athletes' Morphology
### Aliases: morphosport
### Keywords: datasets

### ** Examples

data(morphosport)
plot(discrimin(dudi.pca(morphosport$tab, scan = FALSE), 
    morphosport$sport, scan = FALSE))



