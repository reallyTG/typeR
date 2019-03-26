library(vcdExtra)


### Name: TV
### Title: TV Viewing Data
### Aliases: TV
### Keywords: datasets

### ** Examples

data(TV)
structable(TV)
doubledecker(TV)

# reduce number of levels of Time
TV.df <- as.data.frame.table(TV)
levels(TV.df$Time) <- rep(c("8:00-8:59", "9:00-9:59", "10:00-10:44"), c(4, 4, 3))
TV2 <- xtabs(Freq ~ Day + Time + Network, TV.df)

# re-label for mosaic display
levels(TV.df$Time) <- c("8", "9", "10")
# fit mode of joint independence, showing association of Network with Day*Time
mosaic(~ Day + Network + Time, data = TV.df, expected = ~ Day:Time + Network, legend = FALSE)
# with doubledecker arrangement
mosaic(~ Day + Network + Time, data = TV.df, expected = ~ Day:Time + Network,
  split = c(TRUE, TRUE, FALSE), spacing = spacing_highlighting, legend = FALSE)



