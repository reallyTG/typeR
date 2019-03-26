library(nlme)


### Name: getData.lme
### Title: Extract lme Object Data
### Aliases: getData.lme getData.nlme getData.nls
### Keywords: models

### ** Examples

fm1 <- lme(follicles ~ sin(2*pi*Time) + cos(2*pi*Time), data = Ovary,
           random = ~ sin(2*pi*Time))
getData(fm1)



