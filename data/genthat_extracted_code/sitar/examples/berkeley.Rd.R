library(sitar)


### Name: berkeley
### Title: The Berkeley Child Guidance Study
### Aliases: berkeley
### Keywords: datasets

### ** Examples

data(berkeley)
## frequencies of age of measurement for each variable
## weight and length/height from birth, other variables from 6-8 years
## few measurements after 18 years
. <- as.factor(berkeley$age)
plot(levels(.), summary(.), type='s', las=1,
  xlab='age of measurement (years)', ylab='frequency of measurements')
points(levels(.), levels(.) < 0, pch=15)
for (i in 3:9) {
  .. <- .[!is.na(berkeley[, names(berkeley)[i]])]
  lines(levels(..), summary(..), type='s', col=i)
}
legend('topright', names(berkeley)[c(3:9)], text.col=c(3:9), bty='n', inset=0.04)



