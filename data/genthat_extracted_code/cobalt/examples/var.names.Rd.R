library(cobalt)


### Name: var.names
### Title: Extract Variable Names from 'bal.tab' Objects
### Aliases: var.names

### ** Examples

data(lalonde)

b1 <- bal.tab(treat ~ age + race + married, data = lalonde,
             int = TRUE)
v1 <- var.names(b1, type = "vec", minimal = TRUE)
v1["age"] <- "Age (Years)"
v1["race"] <- "Race/Eth"
v1["married"] <- "Married"
love.plot(b1, var.names = v1)

## Not run: 
##D b2 <- bal.tab(treat ~ age + race + married + educ + nodegree +
##D               re74 + re75 + I(re74==0) + I(re75==0), 
##D               data = lalonde)
##D var.names(b2, file = "varnames.csv")
##D 
##D ##Manually edit the CSV (e.g., in Excel), then save it.
##D ##
##D v2 <- read.csv("varnames.csv")
##D love.plot(b2, var.names = v2)
## End(Not run)




