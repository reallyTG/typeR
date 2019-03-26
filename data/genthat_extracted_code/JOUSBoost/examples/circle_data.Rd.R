library(JOUSBoost)


### Name: circle_data
### Title: Simulate data from the circle model.
### Aliases: circle_data

### ** Examples

# Generate data from the circle model
set.seed(111)
dat = circle_data(n = 500, inner_r = 1, outer_r = 5)

## Not run: 
##D # Visualization of conditional probability p(y=1|x)
##D inner_r = 0.5
##D outer_r = 1.5
##D x = seq(-outer_r, outer_r, by=0.02)
##D radius = sqrt(outer(x^2, x^2, "+"))
##D prob = ifelse(radius >= outer_r, 0, ifelse(radius <= inner_r, 1,
##D              (outer_r-radius)/(outer_r-inner_r)))
##D image(x, x, prob, main='Probability Density: Circle Example')
## End(Not run)




