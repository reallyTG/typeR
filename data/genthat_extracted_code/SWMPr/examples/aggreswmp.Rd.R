library(SWMPr)


### Name: aggreswmp
### Title: Aggregate swmpr data
### Aliases: aggreswmp aggreswmp.swmpr

### ** Examples

## Not run: 
##D ## get data, prep
##D data(apacpwq)
##D dat <- apacpwq
##D swmpr_in <- subset(qaqc(dat), rem_cols = TRUE)
##D 
##D ## get mean DO by quarters
##D aggreswmp(swmpr_in, 'quarters', params = c('do_mgl'))
##D 
##D ## get a plot instead
##D aggreswmp(swmpr_in, 'quarters', params = c('do_mgl'), plot = T)
##D 
##D ## plots with other variables
##D p <- aggreswmp(swmpr_in, 'months', params = c('do_mgl', 'temp', 'sal'), plot = T)
##D p
##D library(ggplot2)
##D p + geom_boxplot(aes(fill = var)) + theme(legend.position = 'none')
##D 
##D ## get variance of DO by years, remove NA when calculating variance
##D ## omit NA data in output
##D fun_in <- function(x)  var(x, na.rm = TRUE)
##D aggreswmp(swmpr_in, FUN = fun_in, 'years') 
## End(Not run)



