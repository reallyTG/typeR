library(sbpiper)


### Name: gen_stats_table
### Title: Generate a table of statistics for each model readout.
### Aliases: gen_stats_table

### ** Examples

data(insulin_receptor_1)
data(insulin_receptor_2)
data(insulin_receptor_3)
dir.create(file.path("sim_datasets"))
dir.create(file.path("sim_datasets_sum"))
write.table(insulin_receptor_1, 
            file=file.path("sim_datasets","insulin_receptor_1.csv"), 
            row.names=FALSE)
write.table(insulin_receptor_2, 
            file=file.path("sim_datasets","insulin_receptor_2.csv"), 
            row.names=FALSE)
write.table(insulin_receptor_3, 
            file=file.path("sim_datasets","insulin_receptor_3.csv"), 
            row.names=FALSE)
summarise_data(inputdir="sim_datasets", 
               model="insulin_receptor", 
               outputfile=file.path("sim_datasets_sum", 
                                    "insulin_receptor_IR_beta_pY1146.csv"), 
               column_to_read="IR_beta_pY1146")
gen_stats_table(inputfile=file.path("sim_datasets_sum", 
                                    "insulin_receptor_IR_beta_pY1146.csv"), 
                outputfile="insulin_receptor_IR_beta_pY1146_stats.csv", 
                column_to_read="IR_beta_pY1146")



