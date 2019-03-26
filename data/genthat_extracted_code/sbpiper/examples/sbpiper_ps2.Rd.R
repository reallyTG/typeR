library(sbpiper)


### Name: sbpiper_ps2
### Title: Main R function for SBpipe pipeline: parameter_scan2().
### Aliases: sbpiper_ps2

### ** Examples

## No test: 
data(insulin_receptor_ps2_tp2)
dir.create(file.path("ps2_datasets"))
write.table(insulin_receptor_ps2_tp2, 
            file=file.path("ps2_datasets", 
                           "insulin_receptor_InsulinPercent__IRbetaPercent__rep_1__tp_2.csv"), 
            row.names=FALSE)
sbpiper_ps2(model="insulin_receptor_InsulinPercent__IRbetaPercent", 
           scanned_par1="InsulinPercent", 
           scanned_par2="IRbetaPercent", 
           inputdir="ps2_datasets", 
           outputdir="ps2_plots", 
           run=1)
## End(No test)



