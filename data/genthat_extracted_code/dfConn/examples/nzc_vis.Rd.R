library(dfConn)


### Name: nzc_vis
### Title: Non-zero coverage correlation matrix visualization
### Aliases: nzc_vis
### Keywords: Non-zero coverage, matrix

### ** Examples

# load sample summary of the linear mixed model output
data(coverage.tbl.list)
data(DynModel_results)
nzc_vis(coverage.tbl.list, DynModel_results$modelDyn_results,
        roi=c(54,191,235), DynModel_results$params$ntp_per_scan, save_fig=FALSE)
## Don't show: 
rm(list=c('DynModel_results','coverage.tbl.list'))
gc()
## End(Don't show)       



