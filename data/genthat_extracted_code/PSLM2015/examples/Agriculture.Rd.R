library(PSLM2015)


### Name: Agriculture
### Title: Agriculture data from Pakistan Social and Living Standard
###   Measures 2015
### Aliases: Agriculture
### Keywords: datasets

### ** Examples

 # library(PSLM2015)
 # data("Agriculture")
 # library(dplyr)
 # Agriculture %>%
 #   group_by(Province, Region) %>%
 #   summarise(TotalOperationalLand = sum(a110, na.rm = TRUE))
 # library(ggplot2)
 # ggplot(data = Agriculture, mapping = aes(x = Province, y = a110)) + 
 #   geom_col() +
 #   labs(y = "Total Operational Land") +
 #   facet_grid(. ~ Region)
 # 
 #   # Merging two data files
 #   data("Employment")
 #   data("Agriculture")
 #    ab <- Employment %>% 
 #    filter(s1bq06 %in% 
 #    c("Own cultivator","Share cropper", "Contract cultivator")
 #    |s1bq14 %in% c("Own cultivator","Share cropper", "Contract cultivator"))
 #   
 #   EmpAgri <- ab %>% left_join(Agriculture, by = c("hhcode", "Province", "Region", "PSU"))
 #   str(EmpAgri)




