library(fastR2)


### Name: HeliumFootballs
### Title: Punting helium- and air-filled footballs
### Aliases: HeliumFootballs
### Keywords: datasets

### ** Examples


data(HeliumFootballs)
gf_point(helium ~ air, data = HeliumFootballs)
gf_dhistogram( 
  ~ (helium - air), data = HeliumFootballs, 
  fill = ~ (helium > air),  bins = 15, boundary = 0 
)




