library(mosaicData)


### Name: SnowGR
### Title: Snowfall data for Grand Rapids, MI
### Aliases: SnowGR
### Keywords: datasets

### ** Examples

data(SnowGR)
if (require(mosaic)) {
  df_stats(~ Total, data = SnowGR)
  gf_histogram( ~ Total, data = SnowGR)
  gf_point(Total ~ SeasonStart, data = SnowGR) %>%
    gf_smooth()
}
if (require(tidyr)) {
  Snow2 <- 
    SnowGR %>%
    gather("Time", "Snowfall", Jul:Total) 
  gf_boxplot(Snowfall ~ Time, data = Snow2)
}




