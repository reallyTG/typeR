library(neverhpfilter)


### Name: yth_glm
### Title: Fits Hamilton's alternative model
### Aliases: yth_glm

### ** Examples

data(GDPC1)

gdp_model <- yth_glm(GDPC1, h = 8, p = 4, family = gaussian)

summary(gdp_model)

plot(gdp_model)




