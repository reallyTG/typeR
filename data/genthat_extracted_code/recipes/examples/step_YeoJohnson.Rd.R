library(recipes)


### Name: step_YeoJohnson
### Title: Yeo-Johnson Transformation
### Aliases: step_YeoJohnson tidy.step_YeoJohnson
### Keywords: datagen

### ** Examples


data(biomass)

biomass_tr <- biomass[biomass$dataset == "Training",]
biomass_te <- biomass[biomass$dataset == "Testing",]

rec <- recipe(HHV ~ carbon + hydrogen + oxygen + nitrogen + sulfur,
              data = biomass_tr)

yj_trans <- step_YeoJohnson(rec,  all_numeric())

yj_estimates <- prep(yj_trans, training = biomass_tr)

yj_te <- bake(yj_estimates, biomass_te)

plot(density(biomass_te$sulfur), main = "before")
plot(density(yj_te$sulfur), main = "after")

tidy(yj_trans, number = 1)
tidy(yj_estimates, number = 1)



