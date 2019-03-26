library(RND)


### Name: dmln.am
### Title: Density of Mixture Lognormal for American Options
### Aliases: dmln.am

### ** Examples

###
### Just look at a generic density and see if it integrates to 1.
###

u.1     = 4.2
u.2     = 4.5
u.3     = 4.8
sigma.1 = 0.30
sigma.2 = 0.20
sigma.3 = 0.15
p.1     = 0.25
p.2     = 0.45
x = seq(from = 0, to = 250, by = 0.01)
y = dmln.am(x = x, u.1 = u.1, u.2 = u.2, u.3 = u.3, sigma.1 = sigma.1, sigma.2 = sigma.2, 
            sigma.3 = sigma.3, p.1 = p.1, p.2 = p.2)

plot(y ~ x, type="l")
sum(y * 0.01)

###
### Yes, the sum is near 1.
###



