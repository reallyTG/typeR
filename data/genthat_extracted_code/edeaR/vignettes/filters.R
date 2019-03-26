## ------------------------------------------------------------------------
library(bupaR)
library(edeaR)
library(eventdataR)

## ------------------------------------------------------------------------
patients %>%
	filter_activity(c("X-Ray", "Blood test")) %>%
	summary

## ------------------------------------------------------------------------
patients %>%
	filter_activity_frequency(percentile_cut_off = 0.5, reverse = T) %>%
	activity_frequency("activity")
	

## ------------------------------------------------------------------------
patients %>% 
	filter_attributes(employee == "r1" | handling == "X-Ray") 

## ------------------------------------------------------------------------
patients %>%
	filter_resource(c("r1","r4")) %>%
	resource_frequency("resource")

## ------------------------------------------------------------------------
patients %>%
	filter_trim(start_activities = "Registration", end_activities =  c("MRI SCAN","X-Ray")) %>%
	traces()

