library(ALTopt)


### Name: altopt.rc
### Title: Optimal design with right censoring.
### Aliases: altopt.rc

### ** Examples

## Not run: 
##D # Generating D optimal design for right censoring.
##D altopt.rc("D", 100, 100, 2, 1, formula = ~ x1 + x2 + x1:x2,
##D coef = c(0, -4.086, -1.476, 0.01))
##D 
##D # Generating U optimal design for right censoring.
##D altopt.rc("D", 100, 100, 2, 1, formula = ~ x1 + x2 + x1:x2,
##D coef = c(0, -4.086, -1.476, 0.01), useCond = c(1.758, 3.159))
##D 
##D # Generating I optimal design for right censoring.
##D altopt.rc("D", 100, 100, 2, 1, formula = ~ x1 + x2 + x1:x2,
##D coef = c(0, -4.086, -1.476, 0.01), useLower = c(1.458, 2.859),
##D useUpper = c(2.058, 3.459))
## End(Not run)



