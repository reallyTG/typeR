library(prefmod)


### Name: pattnpml.fit
### Title: NPML estimation for paired comparison models
### Aliases: pattnpml.fit
### Keywords: models regression

### ** Examples

# two latent classes for paired comparison data
dfr   <- patt.design(dat4, 4)
modPC <- pattnpml.fit(y ~ 1, random = ~o1 + o2 + o3, k = 2, design = dfr)
modPC

# estimated proportion of cases in each mixture component
apply(modPC$post.prob, 2, function(x){ sum(x * dfr$y / sum(dfr$y)) })

## Not run: 
##D # fitting a model for two latent classes and fixed categorical subject
##D # covariates to the Eurobarometer 55.2 data (see help("euro55.2.des"))
##D # on rankings of sources of information on scientific developments
##D 
##D model2cl <- pattnpml.fit(
##D   y ~ SEX:AGE4 + (SEX + AGE4):(TV + RAD + NEWSP + SCIMAG + WWW + EDINST) - 1,
##D   random = ~ TV + RAD + NEWSP + SCIMAG + WWW + EDINST,
##D   k = 2, design = euro55.2.des, pr.it = TRUE)
##D summary(model2cl)
##D BIC(model2cl)
## End(Not run)



