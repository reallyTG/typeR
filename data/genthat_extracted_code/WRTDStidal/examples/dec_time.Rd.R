library(WRTDStidal)


### Name: dec_time
### Title: Create decimal time from time vector
### Aliases: dec_time dec_time.Date

### ** Examples

dt <- Sys.Date()
dts <- seq.Date(dt - 365, dt, by = 'day') 

dec_time(dts)



