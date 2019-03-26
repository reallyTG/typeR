library(flars)


### Name: fccaGen
### Title: Functional canonical correlation analysis between a scalar
###   variable and a list of mixed scalar and functional variables.
### Aliases: fccaGen

### ** Examples

library(flars)
## Generate some data.
dataL=data_generation(seed = 1,uncorr = TRUE,nVar = 8,nsamples = 120,
      var_type = 'm',cor_type = 1)

## If there is only one functional variable
# out1=fccaGen(dataL$x[1], dataL$y, type='all', method='basis')

## If there are only a few scalar variables
# x=matrix(rnorm(3*length(dataL$y)),ncol=3)
# out2=fccaGen(x, dataL$y, type='all', method='basis')

## If there are mixed scalar and functional variables
# out3=fccaGen(dataL$x, dataL$y, type='all', method='basis')



