library(sbpiper)


### Name: summarise_data
### Title: Summarise the model simulation repeats in a single file.
### Aliases: summarise_data

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



