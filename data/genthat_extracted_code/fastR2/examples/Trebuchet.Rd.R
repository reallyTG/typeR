library(fastR2)


### Name: Trebuchet
### Title: Trebuchet data
### Aliases: Trebuchet Trebuchet1 Trebuchet2
### Keywords: datasets

### ** Examples


data(Trebuchet); data(Trebuchet1); data(Trebuchet2)
gf_point(distance ~ projectileWt, data = Trebuchet1)
gf_point(distance ~ projectileWt, data = Trebuchet2)
gf_point(distance ~ projectileWt, color = ~ factor(counterWt), data = Trebuchet) %>%
  gf_smooth(alpha = 0.2, fill = ~factor(counterWt))




