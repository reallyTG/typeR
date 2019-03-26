library(SASxport)
Sys.setenv("TZ"="GMT")

## Create a small data set containing dates, times, and date-times

dates <- c("02/27/92", "02/27/92", "01/14/92", "02/28/92", "02/01/92")
times <- c("23:03:20", "22:29:56", "01:03:30", "18:21:03", "16:56:26")
 

temp <- data.frame(x=c(1, 2, 3, 4, 5 ),
                   y=c('a', 'B', 'c', 'd', 'e' ),
                   dates=strptime(dates, "%m/%d/%y"),
                   datetimes=strptime( paste(dates,times), "%m/%d/%y %H:%M:%S")
)

print(temp)

write.xport( DATETIME=temp, file="datetime.xpt")
temp2 <- read.xport(file="datetime.xpt", names.tolower=FALSE)

print(temp2)


identical(temp, temp2)
