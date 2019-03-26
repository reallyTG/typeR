library(deaR)


### Name: slacks
### Title: Slacks
### Aliases: slacks

### ** Examples

 data("Coll_Blasco_2006")
 data_example <- read_data(Coll_Blasco_2006,
                           dmus = 1, 
                           ni = 2, 
                           no = 2)
 result <- model_multiplier(data_example,
                            orientation = "io", 
                            rts = "crs")
 slacks(result)
 



