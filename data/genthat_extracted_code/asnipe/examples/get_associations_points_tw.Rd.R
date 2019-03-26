library(asnipe)


### Name: get_associations_points_tw
### Title: Calculate Group Membership using Time Window
### Aliases: get_associations_points_tw

### ** Examples


data("identified_individuals")

## calculate group_by_individual for first day at one location
group_by_individual <- get_associations_points_tw(identified_individuals, time_window=180, 
	which_days=1,which_locations="1B")

## split the resulting list
times <- group_by_individual[[2]]
locations <- group_by_individual[[3]]
group_by_individual <- group_by_individual[[1]]




