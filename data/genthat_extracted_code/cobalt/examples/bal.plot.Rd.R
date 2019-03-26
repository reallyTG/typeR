library(cobalt)


### Name: bal.plot
### Title: Generate Univariate Balance Plots
### Aliases: bal.plot

### ** Examples

library(MatchIt); data("lalonde", package = "cobalt")

#Nearest Neighbor Matching
m.out <- matchit(treat ~ age + educ + race + 
                 married + nodegree + re74 + re75, 
                 data = lalonde)

bal.plot(m.out, "age", which = "both")
bal.plot(m.out, "race", which = "both")
bal.plot(m.out, "distance", which = "both", mirror = TRUE,
         type = "histogram", colors = c("white", "black"))



