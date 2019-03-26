library(PSLM2015)


### Name: Housing
### Title: Housing data from Pakistan Social and Living Standards
###   Measurement 2015-16
### Aliases: Housing
### Keywords: datasets

### ** Examples

 # library(PSLM2015)
 # data("Housing")
 # library(dplyr)
 # AvgRooms <- Housing %>%
 #   group_by(Province, Region) %>%
 #   summarise(AvgRooms = mean(S3aq04, na.rm = TRUE))
 # 
 # library(ggplot2)
 # ggplot(data = AvgRooms , mapping = aes(x = Province, y = AvgRooms)) +
 #   geom_col() +
 #   facet_grid(. ~ Region)
 # 
 # # Merging two data files
 # 
 #   data("Employment")
 #   data("Housing")
 #   HeadHH <- HHRoster %>% filter(s1aq02 == "Head")
 #   EmpHous <- HeadHH %>% left_join(Housing, by = c("hhcode"))
 #   str(EmpHous)



