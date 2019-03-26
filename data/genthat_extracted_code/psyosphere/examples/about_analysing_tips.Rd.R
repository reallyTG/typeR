library(psyosphere)


### Name: about analysing tips
### Title: Guide how to analyse GPS data
### Aliases: about_analysing_tips

### ** Examples

# Remove data before begin and after end ---------------------------------------
data(psyo_rounds2)
tracks <- psyo_rounds2
begin <- as.POSIXct("2015-09-03 14:00:00")
end <- as.POSIXct("2015-09-03 14:20:00")
tracks <- tracks[ tracks[,"time"] > begin & tracks[,"time"] < end ,]



