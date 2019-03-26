library(pitchRx)


### Name: pitches
### Title: Sample PITCHf/x Data Set
### Aliases: pitches
### Keywords: datasets

### ** Examples

#This can reproduce data(pitches), but it takes a while...
## Not run: 
##D data <- scrape(start="2011-01-01", end="2011-12-31")
##D names <- c("Mariano Rivera", "Phil Hughes")
##D atbats <- subset(data$atbat, pitcher_name %in% names)
##D pitchFX <- plyr::join(atbats, data$pitch, by=c("num", "url"), type="inner")
##D pitches <- subset(pitchFX, pitch_type %in% c("FF", "FC"))
## End(Not run)



