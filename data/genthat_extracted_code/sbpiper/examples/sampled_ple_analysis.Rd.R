library(sbpiper)


### Name: sampled_ple_analysis
### Title: Run the profile likelihood estimation analysis.
### Aliases: sampled_ple_analysis

### ** Examples

dir.create(file.path("pe_datasets"))
dir.create(file.path("pe_plots"))
data(insulin_receptor_all_fits)
write.table(insulin_receptor_all_fits, 
            file=file.path("pe_datasets", "all_fits.csv"), 
            row.names=FALSE)
# generate the global statistics for the parameter estimation
pe_ds_preproc(filename=file.path("pe_datasets", "all_fits.csv"), 
              param.names=c('k1', 'k2', 'k3'), 
              logspace=TRUE, 
              all.fits=TRUE, 
              data_point_num=33, 
              fileout_param_estim_summary=file.path("pe_datasets", "param_estim_summary.csv"))
sampled_ple_analysis(model="ir_beta", 
                     filename=file.path("pe_datasets", "all_fits_log10.csv"), 
                     parameter="k1", 
                     plots_dir="pe_plots", 
                     fileout_param_estim_summary=file.path("pe_datasets", 
                                                           "param_estim_summary.csv"),
                     logspace=TRUE)



