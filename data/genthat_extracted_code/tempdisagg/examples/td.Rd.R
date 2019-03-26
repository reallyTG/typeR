library(tempdisagg)


### Name: td
### Title: Temporal Disaggregation of Time Series
### Aliases: td
### Keywords: models ts,

### ** Examples

data(swisspharma)

# one indicator, no intercept 
mod1 <- td(sales.a ~ 0 + exports.q) 
summary(mod1)  # summary statistics 
plot(mod1)  # residual plot of regression 
plot(predict(mod1))  

# interpolated quarterly series
 
# temporally aggregated series is equal to the annual value 
all.equal(window(
  ta(predict(mod1), conversion = "sum", to = "annual"),
  start = 1975), sales.a)
 
# several indicators, including an intercept 
mod2 <- td(sales.a ~ imports.q + exports.q)
 
# no indicator (Denton-Cholette) 
mod3 <- td(sales.a ~ 1, to = "quarterly", method = "denton-cholette")
 
# no indicator (uniform) 
mod4 <- td(sales.a ~ 1, to = "quarterly", method = "uniform")

# Dynamic Chow-Lin (Santos Silva and Cardoso, 2001)
# (no truncation parameter added, because rho = 0)
mod5 <- td(sales.a ~ exports.q, method = "dynamic-maxlog") 

# Example from Denton (1971), see references. 
d.q <- ts(rep(c(50, 100, 150, 100), 5), frequency = 4) 
d.a <- ts(c(500, 400, 300, 400, 500))
 
a1 <- predict(td(d.a ~ 0 + d.q, method = "denton", 
                 criterion = "additive", h = 0)) 
a2 <- predict(td(d.a ~ 0 + d.q, method = "denton", 
                 criterion = "additive", h = 1)) 
a3 <- predict(td(d.a ~ 0 + d.q, method = "denton", 
                 criterion = "additive", h = 2)) 
a4 <- predict(td(d.a ~ 0 + d.q, method = "denton", 
                 criterion = "additive", h = 3))
 
p1 <- predict(td(d.a ~ 0 + d.q, method = "denton", 
                 criterion = "proportional", h = 0)) 
p2 <- predict(td(d.a ~ 0 + d.q, method = "denton", 
                 criterion = "proportional", h = 1)) 
p3 <- predict(td(d.a ~ 0 + d.q, method = "denton", 
                 criterion = "proportional", h = 2)) 
p4 <- predict(td(d.a ~ 0 + d.q, method = "denton", 
                 criterion = "proportional", h = 3))
 
# Table in Denton (1971), page 101: 
round(cbind(d.q, a1, a2, a3, a4, p1, p2, p3, p4))
 



