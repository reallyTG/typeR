library(cluster)


### Name: animals
### Title: Attributes of Animals
### Aliases: animals
### Keywords: datasets

### ** Examples

data(animals)
apply(animals,2, table) # simple overview

ma <- mona(animals)
ma
## Plot similar to Figure 10 in Struyf et al (1996)
plot(ma)



