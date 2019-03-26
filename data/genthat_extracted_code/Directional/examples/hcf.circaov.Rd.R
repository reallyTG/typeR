library(Directional)


### Name: Anova for circular data
### Title: Analysis of variance for circular data
### Aliases: hcf.circaov lr.circaov embed.circaov het.circaov
### Keywords: Circular data Analysis of variance Hypothesis testing

### ** Examples

x <- rvonmises(100, 2.4, 15)
ina <- rep(1:4,each = 25)
hcf.circaov(x, ina, rads = TRUE)
lr.circaov(x, ina, rads = TRUE)
het.circaov(x, ina, rads = TRUE)
embed.circaov(x, ina, rads = TRUE)



