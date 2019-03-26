library(broom.mixed)


### Name: gamlss_tidiers
### Title: Tidying methods for gamlss objects
### Aliases: gamlss_tidiers tidy.gamlss

### ** Examples

if (requireNamespace("gamlss", quietly = TRUE) &&
    requireNamespace("gamlss.data", quietly = TRUE)) {
    data(abdom, package="gamlss.data")
    ## Not run: 
##D          mod <- gamlss(y~pb(x), sigma.fo=~pb(x), family=BCT,
##D                        data=abdom, method=mixed(1,20))
##D     
## End(Not run)
    ## load stored object
    mod <- readRDS(system.file("extdata", "gamlss_example.rds",
                   package="broom.mixed"))
    tidy(mod)
}




