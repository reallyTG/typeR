library(QuantNorm)


### Name: QuantNorm
### Title: Adjust the distance matrix by quantile normalization for data
###   with batch effect
### Aliases: QuantNorm

### ** Examples


library(pheatmap) #drawing heatmap

data("ENCODE") #load the ENCODE data

#Before correction, the subjects are clustered by species
pheatmap(cor(ENCODE))

#Assigning the batches based on species
batches <- c(rep(1,13),rep(2,13))

#QuantNorm correction
corrected.distance.matrix <- QuantNorm(ENCODE,batches,method='row/column', cor_method='pearson',
                                       logdat=FALSE, standardize = TRUE, tol=1e-4)
pheatmap(1-corrected.distance.matrix)



