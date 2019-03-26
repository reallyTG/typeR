library(FENmlm)


### Name: femlm
### Title: Fixed effects maximum likelihood models
### Aliases: femlm

### ** Examples


#
# Linear examples
#

# Load trade data
data(trade)

# We estimate the effect of distance on trade => we account for 3 cluster effects
# 1) Poisson estimation
est_pois = femlm(Euros ~ log(dist_km)|Origin+Destination+Product, trade)
# alternative formulation giving the same results:
# est_pois = femlm(Euros ~ log(dist_km), trade, cluster = c("Origin", "Destination", "Product"))

# 2) Log-Log Gaussian estimation (with same clusters)
est_gaus = update(est_pois, log(Euros+1) ~ ., family="gaussian")

# 3) Negative Binomial estimation
est_nb = update(est_pois, family="negbin")

# Comparison of the results using the function res2table
res2table(est_pois, est_gaus, est_nb)
# Now using two way clustered standard-errors
res2table(est_pois, est_gaus, est_nb, se = "twoway")

# Comparing different types of standard errors
sum_white = summary(est_pois, se = "white")
sum_oneway = summary(est_pois, se = "cluster")
sum_twoway = summary(est_pois, se = "twoway")
sum_threeway = summary(est_pois, se = "threeway")

res2table(sum_white, sum_oneway, sum_twoway, sum_threeway)


#
# Example of Equivalences
#

# equivalence with glm poisson
est_glm <- glm(Euros ~ log(dist_km) + factor(Origin) +
            factor(Destination) + factor(Product), trade, family = poisson)

# coefficient estimates + Standard-error
summary(est_glm)$coefficients["log(dist_km)", ]
est_pois$coeftable

# equivalence with lm
est_lm <- lm(log(Euros+1) ~ log(dist_km) + factor(Origin) +
            factor(Destination) + factor(Product), trade)

# coefficient estimates + Standard-error
summary(est_lm)$coefficients["log(dist_km)", ]
summary(est_gaus, dof_correction = TRUE)$coeftable

#
# Non-linear examples
#

# Generating data for a simple example
n = 100
x = rnorm(n, 1, 5)**2
y = rnorm(n, -1, 5)**2
z1 = rpois(n, x*y) + rpois(n, 2)
base = data.frame(x, y, z1)

# Estimating a 'linear' relation:
est1_L = femlm(z1 ~ log(x) + log(y), base)
# Estimating the same 'linear' relation using a 'non-linear' call
est1_NL = femlm(z1 ~ 1, base, NL.fml = ~a*log(x)+b*log(y), NL.start = list(a=0, b=0))
# we compare the estimates with the function res2table (they are identical)
res2table(est1_L, est1_NL)

# Now generating a non-linear relation (E(z2) = x + y + 1):
z2 = rpois(n, x + y) + rpois(n, 1)
base$z2 = z2

# Estimation using this non-linear form
est2_NL = femlm(z2~0, base, NL.fml = ~log(a*x + b*y),
               NL.start = list(a=1, b=2), lower = list(a=0, b=0))
# we can't estimate this relation linearily
# => closest we can do:
est2_L = femlm(z2~log(x)+log(y), base)

# Difference between the two models:
res2table(est2_L, est2_NL)

# Plotting the fits:
plot(x, z2, pch = 18)
points(x, fitted(est2_L), col = 2, pch = 1)
points(x, fitted(est2_NL), col = 4, pch = 2)


# Using a custom Jacobian for the function log(a*x + b*y)
myGrad = function(a,x,b,y){
	s = a*x+b*y
	data.frame(a = x/s, b = y/s)
}

est2_NL_grad = femlm(z2~0, base, NL.fml = ~log(a*x + b*y),
                     NL.start = list(a=1,b=2), nl.gradient = ~myGrad(a,x,b,y))





