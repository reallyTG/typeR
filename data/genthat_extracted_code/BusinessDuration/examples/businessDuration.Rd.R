library(BusinessDuration)


### Name: businessDuration
### Title: businessDuration
### Aliases: businessDuration
### Keywords: business duration days

### ** Examples

### EXAMPLE 1
library(BusinessDuration)

# start date must be in standard R format
startdate <- strptime("2017-07-01 02:02:00",
"%Y-%m-%d %H:%M:%S")

# End date must be in standard R format
enddate <- strptime("2017-07-07 04:48:00",
"%Y-%m-%d %H:%M:%S")

# Business Start time
starttime <- "07:00:00"

# Business End time
endtime <- "17:00:00"

# Custom holiday list
holidaylist <- as.Date(c("2017-01-01" ,"2017-01-02",
"2017-01-16", "2017-02-15", "2017-02-20", "2017-03-31",
"2017-05-29", "2017-07-04", "2017-09-04", "2017-10-09",
"2017-11-10", "2017-11-11", "2017-11-23" ,"2017-12-25"))

# Custom unit of business duration
unit<-"day"

# Calling the function
businessDuration(startdate = startdate,
                 enddate = enddate,
                 starttime = starttime,endtime = endtime,
                 holidaylist = holidaylist,
                 unit = unit)

### EXAMPLE 2
library(BusinessDuration)

# Reading the file as dataframe
inputdata <- data.frame("Index"=1:5,
                        "sys_created_on"=c("12/6/2017 8:29",
                                           "12/1/2017 2:36",
                                           "12/6/2017 8:51",
                                           "12/1/2017 8:05",
                                           "12/1/2017 0:07"),
                        "resolved_at"=c("12/11/2017 4:56",
                                        "12/5/2017 4:10",
                                        "12/6/2017 8:52",
                                        "12/7/2017 6:46",
                                        "12/1/2017 0:23"))

# Converting to standard R datetime format
inputdata$sys_created_on <- strptime(inputdata$sys_created_on,
                                     "%m/%d/%Y %H:%M")
inputdata$resolved_at <- strptime(inputdata$resolved_at,
                                  "%m/%d/%Y %H:%M")

# Business open time
starttime <- "08:00:00"

# Business close time
endtime <- "17:00:00"

# Weekend list
weekend_list <- c("Saturday","Sunday")

# Custom US holidays
US_holiday_list <- as.Date(c("2018-01-01",
                             "2018-05-28",
                             "2018-07-04",
                             "2018-09-03",
                             "2018-11-22",
                             "2018-12-25"))

# Business duration - day, hour, min, sec
unit_hour <- "hour"

# Apply function to entire dataframe
inputdata$Biz_Hour<-lapply(1:nrow(inputdata),function(x){
                    businessDuration(startdate = inputdata$sys_created_on[x],
                    enddate = inputdata$resolved_at[x],
                    starttime = starttime,
                    endtime = endtime,
                    weekendlist = weekend_list,
                    holidaylist = US_holiday_list,
                    unit = unit_hour)})




