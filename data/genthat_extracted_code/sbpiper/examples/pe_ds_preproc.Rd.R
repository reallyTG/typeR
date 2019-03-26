library(sbpiper)


### Name: pe_ds_preproc
### Title: Parameter estimation pre-processing. It renames the data set
###   columns, and applies a log10 transformation if logspace is TRUE.  If
###   all.fits is true, it also computes the confidence levels.
### Aliases: pe_ds_preproc

### ** Examples

dir.create(file.path("pe_datasets"))
data(insulin_receptor_all_fits)
write.table(insulin_receptor_all_fits, 
            file=file.path("pe_datasets", "all_fits.csv"), 
            row.names=FALSE)
pe_ds_preproc(filename=file.path("pe_datasets", "all_fits.csv"), 
              param.names=c('k1', 'k2', 'k3'), 
              logspace=TRUE, 
              all.fits=TRUE, 
              data_point_num=33, 
              fileout_param_estim_summary=file.path("pe_datasets", "param_estim_summary.csv"))
data(insulin_receptor_best_fits)
write.table(insulin_receptor_best_fits, 
            file=file.path("pe_datasets", "best_fits.csv"), 
            row.names=FALSE)
pe_ds_preproc(filename=file.path("pe_datasets", "best_fits.csv"), 
              param.names=c('k1', 'k2', 'k3'), 
              logspace=TRUE, 
              all.fits=FALSE)



