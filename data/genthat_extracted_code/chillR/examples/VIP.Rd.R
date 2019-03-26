library(chillR)


### Name: VIP
### Title: Calculate VIP scores for PLS regression
### Aliases: VIP
### Keywords: utility

### ** Examples


PLS_results<-PLS_pheno(
  weather_data=KA_weather,
  split_month=6,   #last month in same year
  bio_data=KA_bloom,return.all=TRUE)

#return.all makes the function return the whole PLS object - needed for next line to work
  
VIP(PLS_results$PLS_output)
  
 



