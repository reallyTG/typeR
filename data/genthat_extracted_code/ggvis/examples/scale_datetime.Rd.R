library(ggvis)


### Name: scale_datetime
### Title: Add a date-time scale to a ggvis object.
### Aliases: scale_datetime

### ** Examples

set.seed(2934)
dat <- data.frame(
  time = as.Date("2013-07-01") + 1:100,
  value = seq(1, 10, length.out = 100) + rnorm(100)
)
p <- dat %>% ggvis(~time, ~value) %>% layer_points()

# Start and end on month boundaries
p %>% scale_datetime("x", nice = "month")


dist <- data.frame(times = as.POSIXct("2013-07-01", tz = "GMT") +
                           rnorm(200) * 60 * 60 * 24 * 7)
p <- dist %>% ggvis(x = ~times) %>% layer_histograms()
p

# Start and end on month boundaries
p %>% scale_datetime("x", nice = "month")

p %>% scale_datetime("x", utc = TRUE)



