library(BGGE)


### Name: getK
### Title: Kernel matrix for GE genomic selection models
### Aliases: getK

### ** Examples

# create kernel matrix for model MDs using wheat dataset
library(BGLR)

data(wheat)
X <- scale(wheat.X, scale = TRUE, center = TRUE)
rownames(X) <- 1:599
pheno_geno <- data.frame(env = gl(n = 4, k = 599), 
               GID = gl(n=599, k=1, length = 599*4),
               value = as.vector(wheat.Y))
               
 K <- getK(Y = pheno_geno, X = X, kernel = "GB", model = "MDs")              






