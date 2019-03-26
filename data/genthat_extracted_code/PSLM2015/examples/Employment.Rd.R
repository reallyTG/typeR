library(PSLM2015)


### Name: Employment
### Title: Employment and income data from Pakistan Social and Living
###   Standards Measurement 2015-16
### Aliases: Employment
### Keywords: datasets

### ** Examples

 # library(PSLM2015)
 # data("Employment")
 # library(dplyr)
 # x2<- distinct(Employment, hhcode, .keep_all = TRUE)
 # TotalHH<- x2 %>% group_by(Province, Region) %>%
 #   summarise(TotalHH = n())
 # income<- Employment %>% rowwise() %>%
 #   mutate(TotalIncome = sum((s1bq08*s1bq09),s1bq10,s1bq15,s1bq17,s1bq19,s1bq21, na.rm = TRUE))
 # IncomeR <- income %>%
 #   group_by(Province, Region) %>%
 #   summarise(TotalIncome = sum(as.numeric(TotalIncome)))
 # IncomeR2 <- TotalHH %>% left_join(IncomeR, by = c("Province", "Region"))
 # IncomeRate <- IncomeR2 %>% mutate(AverageHHIncome = TotalIncome/TotalHH)
 # 
 # library(ggplot2)
 # ggplot(data = IncomeRate, mapping = aes(x = Province, y = AverageHHIncome)) +
 #   geom_col() +
 #   facet_grid(. ~ Region)
 # 
 # # Merging two data files
 # 
 #   data("Employment")
 #   data("Education")
 #   income <- Employment %>% rowwise() %>%
 #     mutate(TotalIncome = sum((s1bq08*s1bq09),s1bq10,s1bq15,s1bq17,s1bq19,s1bq21, na.rm = TRUE))
 # ab <- select(income, hhcode, idc, TotalIncome)
 # EduEmp<-Education %>% left_join(ab, by = c("hhcode", "idc"))
 # str(EduEmp)




