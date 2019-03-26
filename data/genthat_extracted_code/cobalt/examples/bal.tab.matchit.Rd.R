library(cobalt)


### Name: bal.tab.matchit
### Title: Balance Statistics for MatchIt Objects
### Aliases: bal.tab.matchit

### ** Examples
library(MatchIt); data("lalonde", package = "cobalt")

## Nearest Neighbor matching
m.out1 <- matchit(treat ~ age + educ + race + 
                  married + nodegree + re74 + re75, 
                  data = lalonde, method = "nearest")
bal.tab(m.out1, un = TRUE, m.threshold = .1, 
        v.threshold = 2)

## Subclassification
m.out2 <- matchit(treat ~ age + educ + race + 
                  married + nodegree + re74 + re75, 
                  data = lalonde, method = "subclass")
bal.tab(m.out2, disp.subclass = TRUE)



