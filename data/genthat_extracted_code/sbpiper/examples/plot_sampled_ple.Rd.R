library(sbpiper)


### Name: plot_sampled_ple
### Title: Plot the sampled profile likelihood estimations (PLE). The table
###   is made of two columns: ObjVal | Parameter
### Aliases: plot_sampled_ple

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
# load the fits for this parameter
df <- as.data.frame(data.table::fread(file.path("pe_datasets", "all_fits_log10.csv"), 
                                      select=c("ObjVal", "k2")))
# load the global statistics for the parameter estimation
dt.stats <- data.table::fread(file.path("pe_datasets", "param_estim_summary.csv"), 
                              select=c("MinObjVal", "CL66ObjVal", "CL95ObjVal", "CL99ObjVal"))
df99 <- df[df[ ,"ObjVal"] <= dt.stats$CL99ObjVal, ]
# compute the stats for parameter k2. 
plot_sampled_ple(df99=df99, 
                 cl66_objval=dt.stats$CL66ObjVal, 
                 cl95_objval=dt.stats$CL95ObjVal, 
                 cl99_objval=dt.stats$CL99ObjVal, 
                 plots_dir="pe_plots",
                 model="ir_beta",
                 logspace=TRUE)



