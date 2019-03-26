library(chillR)


### Name: PLS_pheno
### Title: Partial Least Squares analysis of phenology vs. daily mean
###   temperatures
### Aliases: PLS_pheno
### Keywords: analysis phenology

### ** Examples


PLS_results<-PLS_pheno(
  weather_data=KA_weather,
  split_month=6,   #last month in same year
  bio_data=KA_bloom)
  
PLS_results_path<-paste(getwd(),"/PLS_output",sep="")
  
plot_PLS(PLS_results,PLS_results_path)




