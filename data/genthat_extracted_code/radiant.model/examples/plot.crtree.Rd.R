library(radiant.model)


### Name: plot.crtree
### Title: Plot method for the crtree function
### Aliases: plot.crtree

### ** Examples

result <- crtree(titanic, "survived", c("pclass", "sex"), lev = "Yes")
plot(result)
result <- crtree(diamonds, "price", c("carat", "clarity", "cut"))
plot(result, plots = "prune")
result <- crtree(dvd, "buy", c("coupon", "purch", "last"), cp = .01)
plot(result, plots = "imp")




