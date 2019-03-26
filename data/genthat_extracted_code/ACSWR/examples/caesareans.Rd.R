library(ACSWR)


### Name: caesareans
### Title: The Cesarean Cases
### Aliases: caesareans
### Keywords: Poisson regression model

### ** Examples

data(caesareans)
names(caesareans)
cae_pois <- glm(Caesareans~Hospital_Type+Births,data=caesareans,family='poisson')
summary(cae_pois)



