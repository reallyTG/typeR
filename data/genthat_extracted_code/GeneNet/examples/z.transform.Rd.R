library(GeneNet)


### Name: z.transform
### Title: Variance-Stabilizing Transformations of the Correlation
###   Coefficient
### Aliases: z.transform hotelling.transform
### Keywords: univar

### ** Examples

# load GeneNet library
library("GeneNet")

# small example data set 
r <- c(-0.26074194, 0.47251437, 0.23957283,-0.02187209,-0.07699437,
       -0.03809433,-0.06010493, 0.01334491,-0.42383367,-0.25513041)

# transformed data
z1 <- z.transform(r)
z2 <- hotelling.transform(r,7)
z1
z2



