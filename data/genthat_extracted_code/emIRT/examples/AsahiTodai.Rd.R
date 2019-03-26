library(emIRT)


### Name: AsahiTodai
### Title: Asahi-Todai Elite Survey
### Aliases: AsahiTodai
### Keywords: datasets

### ** Examples


## Not run: 
##D ### Real data example: Asahi-Todai survey (not run)
##D ## Collapses 5-category ordinal survey items into 3 categories for estimation
##D data(AsahiTodai)
##D out.varinf <- ordIRT(.rc = AsahiTodai$dat.all, .starts = AsahiTodai$start.values,
##D 					.priors = AsahiTodai$priors, .D = 1,
##D 					.control = {list(verbose = TRUE,
##D                      thresh = 1e-6, maxit = 500)})
##D 
##D ## Compare against MCMC estimates using 3 and 5 categories
##D cor(ideal3, out.varinf$means$x)
##D cor(ideal5, out.varinf$means$x)  
## End(Not run)




