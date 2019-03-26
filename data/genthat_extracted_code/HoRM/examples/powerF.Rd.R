library(HoRM)


### Name: power.F
### Title: Power Function for the General Linear F-Test
### Aliases: power.F
### Keywords: file

### ** Examples
 
## Applied to the toy dataset.

data(toy)

full <- lm(y~x, data = toy)
reduced <- lm(y~1, data = toy)
power.F(full = full, reduced = reduced, alpha = 0.05)



