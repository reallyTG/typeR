library(PSLM2015)


### Name: Education
### Title: Education data from Pakistan Social and Living Standards
###   Measurement 2015-16
### Aliases: Education
### Keywords: datasets

### ** Examples

 # library(PSLM2015)
 # library(dplyr)
 # data("Education")
 # TotalP <- Education %>% group_by(Province, Region) %>%
 #   summarise(TotalPersons = n())
 #   
 # literacy <- Education %>% filter(s2ac01 == "yes" & s2ac02 == "yes" & s2ac03 == "yes")
 #   literateP <- literacy %>%
 #   group_by(Province, Region) %>%
 #   summarise(literatePersons = n())
 #   literacyR <- TotalP %>% left_join(literateP, by = c("Province", "Region"))
 #   literacyRate <- mutate(literacyR, Rate = literatePersons/TotalPersons*100)
 # library(ggplot2)
 # ggplot(data = literacyRate, mapping = aes(x = Province, y = Rate)) +
 #   geom_col() +
 #   facet_grid(. ~ Region)
 # 
 # # Merging two data files
 # 
 #   data("Employment")
 #   data("Education")
 #   income <- Employment %>% rowwise() %>%
 #     mutate(TotalIncome = sum((s1bq08*s1bq09),s1bq10,s1bq15,s1bq17,s1bq19,s1bq21, na.rm = TRUE))
 #   ab <- income %>% select(hhcode, idc, TotalIncome)
 #   EduEmp <- Education %>% left_join(ab, by = c("hhcode", "idc"))
 #   str(EduEmp)




