library(sfadv)


### Name: Farms
### Title: Data set of farm accountancy data
### Aliases: Farms
### Keywords: datasets

### ** Examples

head(Farms)
str(Farms)
summary(Farms)
  
lm.output <- lm(farm_output ~ agri_land + tot_lab + tot_asset + costs, data = Farms)
summary(lm.output)



