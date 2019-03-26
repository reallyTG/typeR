library(sbpiper)


### Name: sbpiper_pe
### Title: Main R function for SBpipe pipeline: parameter_estimation().
### Aliases: sbpiper_pe

### ** Examples

## No test: 
dir.create(file.path("pe_datasets"))
dir.create(file.path("pe_plots"))
data(insulin_receptor_best_fits)
write.table(insulin_receptor_best_fits, 
            file=file.path("pe_datasets", "best_fits.csv"), 
            row.names=FALSE)
data(insulin_receptor_all_fits)
write.table(insulin_receptor_all_fits, 
            file=file.path("pe_datasets", "all_fits.csv"), 
            row.names=FALSE)
sbpiper_pe(model="ir_beta", 
           finalfits_filenamein=file.path("pe_datasets", "best_fits.csv"), 
           allfits_filenamein=file.path("pe_datasets", "all_fits.csv"), 
           plots_dir="pe_plots", 
           data_point_num=33, 
           fileout_param_estim_best_fits_details=file.path("pe_datasets", 
                                                 "param_estim_best_fits_details.csv"), 
           fileout_param_estim_details=file.path("pe_datasets", 
                                                 "param_estim_details.csv"), 
           fileout_param_estim_summary=file.path("pe_datasets", 
                                                 "param_estim_summary.csv"), 
           best_fits_percent=50, 
           plot_2d_66cl_corr=TRUE, 
           plot_2d_95cl_corr=TRUE, 
           plot_2d_99cl_corr=TRUE, 
           logspace=TRUE, 
           scientific_notation=TRUE)
## End(No test)



