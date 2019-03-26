library(spduration)


### Name: add_duration
### Title: Add duration variables to panel data
### Aliases: add_duration

### ** Examples

# Yearly data
data <- data.frame(y=c(0,0,0,1,0), 
                   unitID=c(1,1,1,1,1), 
                   tID=c(2000, 2001, 2002, 2003, 2004))
dur.data <- add_duration(data, "y", "unitID", "tID", freq="year")
dur.data




