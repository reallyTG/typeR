library(tsibble)


### Name: as_tibble.tbl_ts
### Title: Coerce to a tibble or data frame
### Aliases: as_tibble.tbl_ts as.data.frame.tbl_ts

### ** Examples

as_tibble(pedestrian)

# a grouped tbl_ts -----
grped_ped <- pedestrian %>% group_by(Sensor)
as_tibble(grped_ped)



