library(chillR)


### Name: make_all_day_table
### Title: Fill in missing days in incomplete time series
### Aliases: make_all_day_table
### Keywords: utility

### ** Examples


#fill in missing lines in a weather dataset (modified from KA_weather)
day_to_day<-make_all_day_table(KA_weather[c(1:10,20:30),],timestep="day")

#fill in missing hours in the Winters_hours_gaps dataset
Winters_hours<-subset(Winters_hours_gaps, select = -c(Temp_gaps))[1:2000,]
hour_to_hour<-make_all_day_table(Winters_hours,timestep="hour",input_timestep="hour")

#convert Winters_hours_gaps dataset into daily temperature data (min, max, mean)
hour_to_day<-make_all_day_table(Winters_hours,timestep="day",input_timestep="hour")
hour_to_day<-make_all_day_table(Winters_hours,timestep="day",input_timestep="hour",
                               aggregation_hours=c(3,3,2))




