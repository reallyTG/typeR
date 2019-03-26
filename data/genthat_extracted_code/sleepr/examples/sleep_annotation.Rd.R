library(sleepr)


### Name: sleep_annotation
### Title: Score sleep behaviour from immobility
### Aliases: sleep_annotation sleep_dam_annotation

### ** Examples

dt_one_animal <- toy_ethoscope_data(seed=2)
####### Ethoscope, corrected velocity classification #########
sleep_dt <-  sleep_annotation(dt_one_animal, masking_duration=0)
print(sleep_dt)
# We could make a sleep `barecode'
## Not run: 
##D library(ggplot2)
##D ggplot(sleep_dt, aes(t,y="Animal 1",fill=asleep)) +
##D                                    geom_tile() + scale_x_time()
## End(Not run)
####### Ethoscope, virutal beam cross classification #########
sleep_dt2 <-  sleep_annotation(dt_one_animal,
                             motion_detector_FUN=virtual_beam_cross_detector)
## Not run: 
##D library(ggplot2)
##D ggplot(sleep_dt2, aes(t,y="Animal 1",fill=asleep)) +
##D                                    geom_tile() + scale_x_time()
## End(Not run)
####### DAM data, de facto beam cross classification ######
dt_one_animal <- toy_dam_data(seed=7)
sleep_dt <- sleep_dam_annotation(dt_one_animal)
## Not run: 
##D library(ggplot2)
##D ggplot(sleep_dt, aes(t,y="Animal 1",fill=asleep)) +
##D                                    geom_tile() + scale_x_time()
## End(Not run)



