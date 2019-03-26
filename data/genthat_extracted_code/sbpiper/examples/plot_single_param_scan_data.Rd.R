library(sbpiper)


### Name: plot_single_param_scan_data
### Title: Plot model single parameter scan time courses
### Aliases: plot_single_param_scan_data

### ** Examples

data(insulin_receptor_ps1_l0)
data(insulin_receptor_ps1_l1)
data(insulin_receptor_ps1_l3)
data(insulin_receptor_ps1_l4)
data(insulin_receptor_ps1_l6)
data(insulin_receptor_ps1_l8)
data(insulin_receptor_ps1_l9)
data(insulin_receptor_ps1_l11)
data(insulin_receptor_ps1_l13)
data(insulin_receptor_ps1_l14)
data(insulin_receptor_ps1_l16)
dir.create(file.path("ps1_datasets"))
write.table(insulin_receptor_ps1_l0, 
            file=file.path("ps1_datasets",
                           "insulin_receptor_scan_IR_beta__rep_1__level_0.csv"), 
            row.names=FALSE)
write.table(insulin_receptor_ps1_l1, 
            file=file.path("ps1_datasets",
                           "insulin_receptor_scan_IR_beta__rep_1__level_1.csv"), 
            row.names=FALSE)
write.table(insulin_receptor_ps1_l3, 
            file=file.path("ps1_datasets",
                           "insulin_receptor_scan_IR_beta__rep_1__level_3.csv"), 
            row.names=FALSE)
write.table(insulin_receptor_ps1_l4, 
            file=file.path("ps1_datasets",
                           "insulin_receptor_scan_IR_beta__rep_1__level_4.csv"), 
            row.names=FALSE)
write.table(insulin_receptor_ps1_l6, 
            file=file.path("ps1_datasets",
                           "insulin_receptor_scan_IR_beta__rep_1__level_6.csv"), 
            row.names=FALSE)
write.table(insulin_receptor_ps1_l8, 
            file=file.path("ps1_datasets",
                           "insulin_receptor_scan_IR_beta__rep_1__level_8.csv"), 
            row.names=FALSE)
write.table(insulin_receptor_ps1_l9, 
            file=file.path("ps1_datasets",
                           "insulin_receptor_scan_IR_beta__rep_1__level_9.csv"), 
            row.names=FALSE)
write.table(insulin_receptor_ps1_l11, 
            file=file.path("ps1_datasets",
                           "insulin_receptor_scan_IR_beta__rep_1__level_11.csv"), 
            row.names=FALSE)
write.table(insulin_receptor_ps1_l13, 
            file=file.path("ps1_datasets",
                           "insulin_receptor_scan_IR_beta__rep_1__level_13.csv"), 
            row.names=FALSE)
write.table(insulin_receptor_ps1_l14, 
            file=file.path("ps1_datasets",
                           "insulin_receptor_scan_IR_beta__rep_1__level_14.csv"), 
            row.names=FALSE)
write.table(insulin_receptor_ps1_l16, 
            file=file.path("ps1_datasets",
                           "insulin_receptor_scan_IR_beta__rep_1__level_16.csv"), 
            row.names=FALSE)
plot_single_param_scan_data(
       model="insulin_receptor_scan_IR_beta", 
       inhibition_only=FALSE,
       inputdir="ps1_datasets", 
       outputdir="ps1_plots",
       run=1,
       percent_levels=TRUE, 
       min_level=0, 
       max_level=250, 
       levels_number=10, 
       xaxis_label="Time [m]", 
       yaxis_label="Level [a.u.]")



