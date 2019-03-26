library(blmeco)


### Name: WAIC
### Title: Watanabe-Akaike or widely applicable information criterion
###   (WAIC)
### Aliases: WAIC
### Keywords: model

### ** Examples

data(pondfrog1)
mod1 <- glm(frog ~ ph + waterdepth + temp, data=pondfrog1, family=poisson)
mod2 <- glm(frog ~    + waterdepth + temp, data=pondfrog1, family=poisson)
mod3 <- glm(frog ~ ph +            + temp, data=pondfrog1, family=poisson)
mod4 <- glm(frog ~ ph + waterdepth       , data=pondfrog1, family=poisson)
WAIC(mod1)
WAIC(mod2)
WAIC(mod3)
WAIC(mod4)




