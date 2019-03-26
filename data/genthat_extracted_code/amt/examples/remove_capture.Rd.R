library(amt)


### Name: remove_capture
### Title: Removes Capture Effects
### Aliases: remove_capture remove_capture_effect
###   remove_capture_effect.track_xyt

### ** Examples

library(lubridate)
n <- 10
df <- track(
  x = cumsum(rnorm(n)),
  y = cumsum(rnorm(n)),
  t = ymd_hm("2017-01-01 00:00") +
   hours(seq(0, by = 24, length.out = n))
)

df
remove_capture_effect(df, start = days(1))
remove_capture_effect(df, end = days(2))
remove_capture_effect(df, start = days(1), end = days(2))




