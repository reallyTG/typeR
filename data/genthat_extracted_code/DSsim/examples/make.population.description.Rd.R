library(DSsim)


### Name: make.population.description
### Title: Creates a Population.Description object
### Aliases: make.population.description

### ** Examples

# An example population can be created from the default values:
# - the default region
# - a constant density surface
# - and a population size of 1000
pop.desc <- make.population.description()

# To view an instance of this population
pop <- generate.population(pop.desc, make.detectability(), make.region())
plot(make.region())
plot(pop)

# An example population with covariates which vary by strata
# Make a multi strata region
poly1 <- data.frame(x = c(0,0,100,100,0), y = c(0,100,100,0,0))
poly2 <- data.frame(x = c(200,200,300,300,200), y = c(10,110,110,10,10))
coords <- list(list(poly1), list(poly2))
region <- make.region(coords = coords)
density <- make.density(region)

# Cluzter size is a zero truncated poisson with mean = 5 in strata 1 and a poisson with 
# lambda = 30 in strata 2.
covariate.list <- list()
covariate.list$size <- list(list("ztruncpois", list(mean = 5)),
                            list("poisson", list(lambda = 30)))
                            
# Animal height is generated from a lognormal distribution for both strata
covariate.list$height <- list(list("lognormal", list(meanlog = log(2), sdlog = log(1.25))))

# Animal sex is discrete/categorical, there are more females than males in strata 1 and equal
# numbers in strata 2
covariate.list$sex <- list(data.frame(level = c("male", "female"), prob = c(0.45,0.55)), 
                           data.frame(level = c("male", "female"), prob = c(0.5,0.5)))
                           
# Create covariate description
pop.desc <- make.population.description(region.obj = region, 
                                        density.obj = density, 
                                        covariates = covariate.list, 
                                        N = c(10,10))

# To view the covariate values
pop <- generate.population(pop.desc, detect = make.detectability(), region)
pop@population 
# Note that the covariate values have not affected the detectability (the scale parameter) to 
# do this we need to set the cov.param argument in make.detectability. See ?make.detectability



