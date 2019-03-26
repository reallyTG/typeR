library(PKPDmisc)


### Name: strip_curves
### Title: basic curve stripping to get initial estimates
### Aliases: strip_curves

### ** Examples

## Not run: 
##D strip_curves(df$TIME, df$DV, dose =1000, 5, oral=TRUE)
##D df %>% group_by(ID) %>% do(data.frame(strip_curves(.$TIME, .$DV, 1000, 5, TRUE)))
## End(Not run)



