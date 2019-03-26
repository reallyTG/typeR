library(EdSurvey)


### Name: mixed.sdf
### Title: EdSurvey Mixed-Effects Model
### Aliases: mixed.sdf

### ** Examples

## Not run: 
##D # read in the example data (generated, not real student data)
##D sdf <- readNAEP(system.file("extdata/data", "M36NT2PM.dat", package = "NAEPprimer"))
##D 
##D # subset to a smaller sample
##D sdf_subset <- subset(sdf, scrpsu < 500)
##D 
##D # fast is an argument from WeMix::mix that allows the function to run faster using c++
##D m1 <- mixed.sdf(composite ~ dsex + b017451 + (1|scrpsu), data=sdf_subset,
##D                 weightVar = c('origwt', 'srwt01'),
##D                 fast=TRUE, verbose=1)
##D summary(m1)
##D 
##D # Run multilevel logistic regression model
##D # nQuad is specified to be 7, which means 
##D # the function will use 7 quadrature points for the integration
##D m2 <- mixed.sdf(I(composite >= 214) ~ (1|scrpsu), 
##D                 data=sdf_subset, family = binomial(link="logit"),
##D                 weightVar = c('origwt', 'srwt01'), 
##D                 nQuad = 7, verbose=1)
##D summary(m2)
## End(Not run)



