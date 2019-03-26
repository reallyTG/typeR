library(sleepr)


### Name: curate_dead_animals
### Title: Remove - irrelevant - data after individual have died
### Aliases: curate_dead_animals

### ** Examples

dt1 <- toy_activity_data()
#all movement after day 3 is set at 0
dt1[t > days(3), moving := FALSE]
# one artefact of movement is detected at day 3.5
dt1[t == days(3.5), moving := TRUE]

dt2 <- curate_dead_animals(dt1)
dt3 <- curate_dead_animals(dt1,prop_immobile = 0)
## Not run: 
##D library(ggplot2)
##D ggplot(data=dt1[,test:=1],aes(t, as.numeric(moving))) +
##D   geom_line(data=dt1[,test:=1]) +
##D   geom_line(data=dt2[, test:=2])+
##D   geom_line(data=dt3[, test:=3])+
##D   facet_grid(test ~ .)+
##D   scale_x_time()
## End(Not run)



