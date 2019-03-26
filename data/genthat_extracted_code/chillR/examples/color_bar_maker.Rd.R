library(chillR)


### Name: color_bar_maker
### Title: Make color scheme for bar plots in outputs of the chillR package
### Aliases: color_bar_maker
### Keywords: utility

### ** Examples



PLS_results<-PLS_pheno(
  weather_data=make_all_day_table(KA_weather),
  split_month=6,   #last month in same year
  bio_data=KA_bloom)

colbar<-color_bar_maker(PLS_results$PLS_summary$VIP,PLS_results$PLS_summary$Coef,0.8,
       "RED","DARK GREEN","GREY")




