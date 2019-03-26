library(ggpmisc)


### Name: stat_peaks
### Title: Local maxima (peaks) or minima (valleys)
### Aliases: stat_peaks stat_valleys

### ** Examples

library(ggplot2)
lynx.df <- data.frame(year = as.numeric(time(lynx)), lynx = as.matrix(lynx))
ggplot(lynx.df, aes(year, lynx)) + geom_line() +
  stat_peaks(colour = "red") +
  stat_valleys(colour = "blue")
ggplot(lynx.df, aes(year, lynx)) + geom_line() +
  stat_peaks(colour = "red") +
  stat_peaks(colour = "red", geom = "rug")




