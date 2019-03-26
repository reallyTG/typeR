library(cleanEHR)


### Name: ccRecord-class
### Title: The S4 class which holds all the CCHIC patient record - served
###   as a database.
### Aliases: ccRecord ccRecord-class

### ** Examples

heart_rate <- data.frame(seq(10), rep(70, 10)) # NIHR_HIC_ICU_0108
site_id <- "Q70" #  NIHR_HIC_ICU_0002
episode_id <- "0000001" # NIHR_HIC_ICU_0005

# Create a new episode 
ep <- new.episode(list(NIHR_HIC_ICU_0108=heart_rate, 
                         NIHR_HIC_ICU_0002=site_id, 
                         NIHR_HIC_ICU_0005=episode_id)) 

# modifying records 
rec <- ccRecord() # a new record 
rec <- rec + ep # adding a new episode to the record
rec <- rec + NULL # adding nothing to the record
rec <- rec + rec # adding a record to a record
# Adding a list of episodes 
rec <- ccRecord()
ep1 <- new.episode()
ep2 <- new.episode()
eps.list <- list(ep1, ep2)
new.rec <- rec + eps.list



