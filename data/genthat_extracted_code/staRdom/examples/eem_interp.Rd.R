library(staRdom)


### Name: eem_interp
### Title: Missing values are interpolated within EEM data
### Aliases: eem_interp

### ** Examples

## No test: 
data(eem_list)

remove_scatter <- c()
remove_scatter["raman1"] = TRUE
remove_scatter["raman2"] = TRUE
remove_scatter["rayleigh1"] = TRUE
remove_scatter["rayleigh2"] = TRUE
remove_scatter_width = c(15,10,16,12)

eem_list <- eem_rem_scat(eem_list,remove_scatter,remove_scatter_width)

eem_list <- eem_interp(eem_list)
## End(No test)



