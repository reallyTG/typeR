library(intubate)


### Name: tree
### Title: Interfaces for tree package for data science pipelines.
### Aliases: ntbt_tree
### Keywords: intubate magrittr tree

### ** Examples

## Not run: 
##D library(intubate)
##D library(magrittr)
##D library(tree)
##D 
##D data(cpus, package="MASS")
##D 
##D ## Original function to interface
##D cpus.ltr <- tree(log10(perf) ~ syct+mmin+mmax+cach+chmin+chmax, cpus)
##D cpus.ltr
##D summary(cpus.ltr)
##D plot(cpus.ltr)
##D text(cpus.ltr)
##D 
##D ## The interface reverses the order of data and formula
##D cpus.ltr <- ntbt_tree(cpus, log10(perf) ~ syct+mmin+mmax+cach+chmin+chmax)
##D cpus.ltr
##D summary(cpus.ltr)
##D plot(cpus.ltr);  text(cpus.ltr)
##D 
##D ## so it can be used easily in a pipeline.
##D cpus %>%
##D   ntbt_tree(log10(perf) ~ syct + mmin + mmax + cach + chmin + chmax) %>%
##D   summary()
##D 
##D cpus %>%
##D   ntbt_tree(log10(perf) ~ syct + mmin + mmax + cach + chmin + chmax) %T>%
##D   plot() %>%
##D   text()
##D 
##D iris %>%
##D   ntbt_tree(Species ~.) %>%
##D   summary()
## End(Not run)



