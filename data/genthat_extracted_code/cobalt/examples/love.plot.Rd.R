library(cobalt)


### Name: love.plot
### Title: Generate Balance Plots for Publication
### Aliases: love.plot plot.bal.tab

### ** Examples

library(MatchIt); data("lalonde", package = "cobalt")

## Nearest Neighbor matching
m.out1 <- matchit(treat ~ age + educ + race + 
                  married + nodegree + re74 + re75, 
                  data = lalonde)

love.plot(bal.tab(m.out1), stat = "mean.diffs", threshold = .1, 
          var.order = "unadjusted")

## Using alternate variable names
v <- data.frame(old = c("age", "educ", "race_black", "race_hispan", 
                        "race_white", "married", "nodegree", "re74", 
                        "re75"),
                new = c("Age", "Years of Education", "Black", 
                        "Hispanic", "White", "Married", "No Degree", 
                        "Earnings 1974", "Earnings 1975"))
                
love.plot(bal.tab(m.out1), stat = "mean.diffs", threshold = .1, 
          var.order = "unadjusted", var.names = v)
          
#Changing colors and shapes and adding lines
love.plot(bal.tab(m.out1), stat = "mean.diffs", threshold = .1, 
          var.order = "unadjusted", var.names = v, abs = TRUE,
          shapes = c(22, 25), colors = c("darkblue", "lightblue"),
          line = TRUE)




