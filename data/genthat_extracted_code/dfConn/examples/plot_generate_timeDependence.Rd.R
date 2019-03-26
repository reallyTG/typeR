library(dfConn)


### Name: plot_generate_timeDependence
### Title: 95% Coverage time dependence plots for dFCM
### Aliases: plot_generate_timeDependence

### ** Examples

data(DynModel_results) # Load sample model result object
scan.length <- DynModel_results$params$ntp_per_scan
plot_generate_timeDependence(DynModel_results$est_CI[1], scan.length, rois=c(114,134))
## Don't show: 
rm(list = c('scan.length', 'DynModel_results'))
gc()
## End(Don't show)



