library(bqtl)


### Name: predict.bqtl
### Title: fitted values from QTL models
### Aliases: predict.bqtl fitted.bqtl
### Keywords: methods

### ** Examples


data(little.ana.bc)

fit.pheno <- bqtl(bc.phenotype~locus(15)+locus(42),little.ana.bc)

summary(predict(fit.pheno))

genotype.grid <- expand.grid( c(-1,1), c(-1,1) )     # set up a grid
names(genotype.grid) <- map.names( fit.pheno )       # use matching names

fit.vals <- predict( fit.pheno, genotype.grid )      # make predictions
cbind( genotype.grid, fit.vals )                     # print them!




