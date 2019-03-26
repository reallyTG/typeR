library(MatchItSE)


### Name: abadie_imbens_se
### Title: Abadie Imben's Standard Error for the ATT
### Aliases: abadie_imbens_se

### ** Examples

## Not run: 
##D   library(MatchIt)
##D   data("lalonde")
##D   m.out  <- matchit(treat ~ educ + black, data = lalonde)
##D   att(obj = m.out, Y = lalonde$re78)
##D   abadie_imbens_se(obj = m.out, Y = lalonde$re78)
## End(Not run)



