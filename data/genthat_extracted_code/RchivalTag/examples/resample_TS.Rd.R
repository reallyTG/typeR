library(RchivalTag)


### Name: resample_TS
### Title: resample time series data at a lower resolution
### Aliases: resample_TS empty.resample_TS

### ** Examples

### load sample depth and temperature time series data from miniPAT:
ts_file <- system.file("example_files/104659-Series.csv",package="RchivalTag")
ts_df <- read.table(ts_file, header = TRUE, sep = ",")
head(ts_df)
ts_df$date.long <- as.POSIXct(strptime(paste(ts_df$Day, ts_df$Time), 
                              "%d-%b-%Y %H:%M:%S",tz = "UTC"))

tsims <- resample_TS(ts_df,600)
length(tsims)




