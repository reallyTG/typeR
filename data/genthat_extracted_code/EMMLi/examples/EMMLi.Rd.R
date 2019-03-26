library(EMMLi)


### Name: EMMLi
### Title: Evaluating modularity with maximum likelihood
### Aliases: EMMLi

### ** Examples

 set.seed(1)

 # Chose a filename and directory for output
 dir <- tempdir()
 file <- paste0(dir, 'EMMLiTest.csv')
 
 # Examine a correlation matrix and model dataframe
 dim(macacaCorrel)
 head(macacaModels)

 # run EMMLi
 output <- EMMLi(macacaCorrel, 20, macacaModels, file)

 unlink(file)

 # run EMMLi without writing output
 output <- EMMLi(macacaCorrel, 20, macacaModels)

 # Raw data example to illustrate pitfalls
 corrPath <- system.file("extdata", "M1lmcorrel.csv", package = "EMMLi")
 corr <- read.csv(corrPath, header = FALSE)
 
 modelPath <- system.file("extdata", "macaca_landmarklist.csv", package = "EMMLi")
 mod <- read.csv(modelPath, header = TRUE, row.names = 1)

 # First column should be character or factor. Subsequent columns integer
 sapply(mod, class)

 out <- EMMLi(corr, 42, mod)




