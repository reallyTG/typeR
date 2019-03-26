library(m2r)


### Name: m2_utility
### Title: Utility tools for M2
### Aliases: m2_utility m2_name m2_name<- m2_meta m2_meta<- m2_structure
###   m2_exists m2_ls m2_rm m2_getwd

### ** Examples


## Not run: 
##D  requires Macaulay2
##D 
##D m2("a = 5")
##D m2_ls()
##D m2_exists("a")
##D m2("b = 1")
##D m2_exists(c("a","b","c"))
##D 
##D m2_getwd()
##D 
##D x <- 1
##D class(x) <- "m2"
##D attr(x, "m2_meta") <- list(a = 1, b = 2)
##D m2_meta(x)
##D m2_meta(x, "b")
##D m2_meta(x, "b") <- 5
##D m2_meta(x, "b")
##D 
##D # R <- ring(c("x1", "x2", "x3"))
##D # m2_name(R)
##D # m2(sprintf("class %s", m2_name(R)))
##D # m2_ls()
##D # m2_rm(m2_name(R))
##D # m2_ls()
##D # m2(paste("class", m2_name(R)))
##D 
##D m2_ls()
##D m2_ls(all.names = TRUE)
##D 
##D 
## End(Not run)



