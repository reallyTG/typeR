library(Fahrmeir)


### Name: cells
### Title: Cellular Differentiation
### Aliases: cells
### Keywords: datasets

### ** Examples

str(cells)
cells.poisson <- glm(y~TNF+IFN+TNF:IFN, data=cells, 
                    family=poisson)
summary(cells.poisson)
confint(cells.poisson)
# Now we follow the book, example 2.6, page 51:
# there seems to be overdispersion?
cells.quasi <- glm(y~TNF+IFN+TNF:IFN, data=cells, 
                    family=quasipoisson)
summary(cells.quasi)
anova(cells.quasi)
confint(cells.quasi)
# We follow the book, example 2.7, page 56:
with(cells, tapply(y, factor(TNF), function(x) c(mean(x), var(x))))
# which might indicate the use of a negative binomial model



