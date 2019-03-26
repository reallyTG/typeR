library(MLZ)


### Name: sensitivity_Lc
### Title: Sensitivity to Lc
### Aliases: sensitivity_Lc

### ** Examples

## Not run: 
##D data(SilkSnapper)
##D new.dataset <- new("MLZ_data", Year = 1983:2013, Len_df = SilkSnapper, length.units = "mm",
##D vbLinf = 794, vbK = 0.1)
##D 
##D new.dataset@Lc <- 310
##D new.dataset <- calc_ML(new.dataset)
##D 
##D first.MLZmodel <- ML(new.dataset, 1)
##D Lc.vec <- seq(240, 340, 5)
##D 
##D sensitivity_Lc(new.dataset, first.MLZmodel, Lc.vec)
## End(Not run)



