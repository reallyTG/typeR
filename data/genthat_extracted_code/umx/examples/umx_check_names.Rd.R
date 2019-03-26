library(umx)


### Name: umx_check_names
### Title: umx_check_names
### Aliases: umx_check_names

### ** Examples

require(umx)
data(demoOneFactor) # "x1" "x2" "x3" "x4" "x5"
umx_check_names(c("x1", "x2"), demoOneFactor)
umx_check_names(c("x1", "x2"), as.matrix(demoOneFactor))
umx_check_names(c("x1", "x2"), cov(demoOneFactor[, c("x1","x2")]))
umx_check_names(c("z1", "x2"), data = demoOneFactor, die = FALSE)
umx_check_names(c("x1", "x2"), data = demoOneFactor, die = FALSE, no_others = TRUE)
umx_check_names(c("x1","x2","x3","x4","x5"), data = demoOneFactor, die = FALSE, no_others = TRUE)
## Not run: 
##D umx_check_names(c("bad_var_name", "x2"), data = demoOneFactor, die = TRUE)
## End(Not run)



