library(fastR2)


### Name: RatPoison
### Title: Rat poison - unfinished documentation
### Aliases: RatPoison
### Keywords: datasets

### ** Examples


data(RatPoison)
gf_line(consumption ~ flavor, group = ~ location, color = ~ location, data = RatPoison) %>%
  gf_point()



