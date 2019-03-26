library(metamisc)


### Name: forest.metapred
### Title: Forest plot of a metapred fit
### Aliases: forest.metapred

### ** Examples

data(DVTipd)

# Internal-external cross-validation of a pre-specified model 'f'
f <- dvt ~ histdvt + ddimdich + sex + notraum
fit <- metapred(DVTipd, strata = "study", formula = f, scope = f, family = binomial)

# Display the model's external performance (expressed as mean squared error by default) 
# for each study
forest(fit)




