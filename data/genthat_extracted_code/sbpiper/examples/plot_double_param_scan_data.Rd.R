library(sbpiper)


### Name: plot_double_param_scan_data
### Title: Plot model double parameter scan time courses.
### Aliases: plot_double_param_scan_data

### ** Examples

data(insulin_receptor_ps2_tp2)
dir.create(file.path("ps2_datasets"))
write.table(insulin_receptor_ps2_tp2, 
            file=file.path("ps2_datasets", 
                           "insulin_receptor_InsulinPercent__IRbetaPercent__rep_1__tp_2.csv"), 
            row.names=FALSE)
plot_double_param_scan_data(model="insulin_receptor_InsulinPercent__IRbetaPercent", 
                            scanned_par1="InsulinPercent", 
                            scanned_par2="IRbetaPercent", 
                            inputdir="ps2_datasets", 
                            outputdir="ps2_plots", 
                            run=1)



