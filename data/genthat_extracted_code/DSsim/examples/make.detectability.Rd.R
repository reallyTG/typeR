library(DSsim)


### Name: make.detectability
### Title: Creates a Detectablility object
### Aliases: make.detectability

### ** Examples

# The default values create a detectability object with a half normal
# detection function with scale parameter 25 and truncation distance 50.
detect <- make.detectability() 
detect

# To include covariate parameters which affect detecability,
# first you need to make sure the population has covariates defined 
# see examples in ?make.population.description
# Multi-strata covariate example
# Make a multi strata region
poly1 <- data.frame(x = c(0,0,100,100,0), y = c(0,100,100,0,0))
poly2 <- data.frame(x = c(200,200,300,300,200), y = c(10,110,110,10,10))
coords <- list(list(poly1), list(poly2))
region <- make.region(coords = coords)
density <- make.density(region)
# Create the population description
covariate.list <- list()
covariate.list$size <- list(list("ztruncpois", list(mean = 3)),
                            list("ztruncpois", list(mean = 5)))
covariate.list$height <- list(list("lognormal", list(meanlog = log(2), sdlog = log(1.25))))
covariate.list$sex <- list(data.frame(level = c("male", "female"), prob = c(0.45,0.55)), 
                           data.frame(level = c("male", "female"), prob = c(0.5,0.5)))
pop.desc <- make.population.description(region.obj = region, 
                                        density.obj = density, 
                                        covariates = covariate.list, 
                                        N = c(10,10))

# In this example height and sex have a global effect where as the effects of size on 
# detectability vary by strata.
cov.params <- list(size = c(log(1.05), log(1.1)), 
                   height = log(1.2), 
                   sex = data.frame(level = c("male", "female"), 
                                    param = c(log(1), log(0.6))))

detect <- make.detectability(key.function = "hn", scale.param = 20, 
                             truncation = 50, cov.param = cov.params)

plot(detect, pop.desc)
                                    
# If we want the effects of sex to be strata specific we can define detectability as follows:
cov.params <- list(size = c(0.05, 0.1), 
                   height = 0.2, 
                   sex = data.frame(level = c("male", "female","male", "female"), 
                                    strata = c("A", "A", "B", "B"),
                                    param = c(0,-0.5, 0.1, -0.25)))  
                                                                       
detect <- make.detectability(key.function = "hn", scale.param = c(20, 25), 
                             truncation = 60, cov.param = cov.params)
plot(detect, pop.desc)




