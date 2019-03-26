library(MatchItSE)


### Name: add_model_matrix
### Title: Rebuilds the model matrix for MatchIt objects
### Aliases: add_model_matrix

### ** Examples

## Not run: 
##D library(MatchIt)
##D data('lalonde')
##D m.out  <- matchit(treat ~ educ + black, data = lalonde, method = 'full')
##D att(obj = m.out, Y = lalonde$re78)
##D abadie_imbens_se(m.out, lalonde$re78)  # FAILS!
##D m.out <- add_model_matrix(m.out)
##D abadie_imbens_se(m.out, lalonde$re78)
## End(Not run)



