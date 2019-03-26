library(Hmisc)


### Name: addMarginal
### Title: Add Marginal Observations
### Aliases: addMarginal
### Keywords: utilities manip

### ** Examples

d <- expand.grid(sex=c('female', 'male'), country=c('US', 'Romania'),
                 reps=1:2)
addMarginal(d, sex, country)

# Example of nested variables
d <- data.frame(state=c('AL', 'AL', 'GA', 'GA', 'GA'),
                city=c('Mobile', 'Montgomery', 'Valdosto',
                       'Augusta', 'Atlanta'),
                x=1:5)
addMarginal(d, state, nested=city) # cite set to 'All' when state is



