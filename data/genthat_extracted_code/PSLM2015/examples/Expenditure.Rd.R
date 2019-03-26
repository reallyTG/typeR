library(PSLM2015)


### Name: Expenditure
### Title: Household's total expenditure data from Pakistan Social and
###   Living Standards Measurement 2015-16
### Aliases: Expenditure
### Keywords: datasets

### ** Examples

 # library(PSLM2015)
 # data("Expenditure")
 # data("Employment")
 # library(dplyr)
 # income<- Employment %>% rowwise() %>%
 #   mutate(TotalIncome = sum((s1bq08*s1bq09), 
 #    s1bq10, s1bq15, s1bq17, s1bq19, s1bq21
 #    , na.rm = TRUE))
 # exp<-Expenditure %>% select(c("hhcode","NonDurable"))
 # HHIncome<-income %>% group_by(hhcode) %>% 
 # summarise(HHAvgIncome = sum(TotalIncome))
 # IncomeExp<-HHIncome %>% left_join(exp, by = "hhcode")



