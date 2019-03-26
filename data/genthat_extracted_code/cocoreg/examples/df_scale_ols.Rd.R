library(cocoreg)


### Name: df_scale_ols
### Title: Scales variables in data.frame dfx using ordinary least squares
###   such
### Aliases: df_scale_ols

### ** Examples

## Not run: 
##D dc <- create_syn_data_toy()
##D ccr <- cocoreg(dc$data)
##D dfLst <- mapply(df_scale_ols, ccr$data, dc$data , SIMPLIFY=F)
## End(Not run)




