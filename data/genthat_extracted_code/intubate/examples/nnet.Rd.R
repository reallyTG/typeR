library(intubate)


### Name: nnet
### Title: Interfaces for nnet package for data science pipelines.
### Aliases: ntbt_multinom ntbt_nnet
### Keywords: intubate magrittr nnet multinom

### ** Examples

## Not run: 
##D library(intubate)
##D library(magrittr)
##D library(nnet)
##D 
##D ## multinom
##D options(contrasts = c("contr.treatment", "contr.poly"))
##D library(MASS)
##D example(birthwt)
##D 
##D ## Original function to interface
##D multinom(low ~ ., bwt)
##D 
##D ## The interface reverses the order of data and formula
##D ntbt_multinom(bwt, low ~ .)
##D 
##D ## so it can be used easily in a pipeline.
##D bwt %>%
##D   ntbt_multinom(low ~ .)
##D 
##D ## nnet
##D ir <- rbind(iris3[,,1],iris3[,,2],iris3[,,3])
##D targets <- class.ind( c(rep("s", 50), rep("c", 50), rep("v", 50)))
##D set.seed(6789) ## for reproducible results
##D samp <- c(sample(1:50,25), sample(51:100,25), sample(101:150,25))
##D ird <- data.frame(rbind(iris3[,,1], iris3[,,2], iris3[,,3]),
##D                   species = factor(c(rep("s",50), rep("c", 50), rep("v", 50))))
##D 
##D ## Original function to interface
##D set.seed(12345) ## for reproducible results
##D nnet(species ~ ., data = ird, subset = samp,
##D      size = 2, rang = 0.1, decay = 5e-4, maxit = 200)
##D 
##D ## The interface reverses the order of data and formula
##D set.seed(12345) ## for reproducible results
##D ntbt_nnet(data = ird, species ~ ., subset = samp,
##D           size = 2, rang = 0.1, decay = 5e-4, maxit = 200)
##D 
##D ## so it can be used easily in a pipeline.
##D set.seed(12345) ## for reproducible results
##D ird %>%
##D   ntbt_nnet(species ~ ., subset = samp,
##D             size = 2, rang = 0.1, decay = 5e-4, maxit = 200)
## End(Not run)



