library(rbokeh)


### Name: catjitter
### Title: Add a small amount of (rbokeh-compatible) noise to a character
###   vector
### Aliases: catjitter

### ** Examples

figure(data = lattice::singer) %>%
  ly_points(catjitter(voice.part), jitter(height), color = "black") %>%
  ly_boxplot(voice.part, height, with_outliers = FALSE)



