library(cocoreg)


### Name: cocoreg
### Title: The Common Components by Regression (CoCoReg) algorithm
### Aliases: cocoreg

### ** Examples

dc <- create_syn_data_toy()
ccr <- cocoreg(dc$data)

ggplot_dflst(dc$data, ncol=1)
ggplot_dflst(ccr$data, ncol=1)

## Not run: 
##D ggplot_dclst(list(orig = dc$data, ccr = ccr$data)) 
##D ggplot_dclst(list(orig = dc$data, shared = ccr$data), legendMode = 'none')
##D ggplot_dclst(list(orig = dc$data, ccr = ccr$data), legendMode = 'all')
## End(Not run)




