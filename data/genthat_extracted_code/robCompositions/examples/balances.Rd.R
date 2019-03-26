library(robCompositions)


### Name: balances
### Title: Balance calculation
### Aliases: balances

### ** Examples

data(expenditures, package = "robCompositions")
y1 <- data.frame(c(1,1,1,-1,-1),c(1,-1,-1,0,0),
                 c(0,+1,-1,0,0),c(0,0,0,+1,-1))
y2 <- data.frame(c(1,-1,1,-1,-1),c(1,0,-1,0,0),
                 c(1,-1,1,-1,1),c(0,-1,0,1,0))
y3 <- data.frame(c(1,1,1,1,-1),c(-1,-1,-1,+1,0),
                 c(-1,-1,+1,0,0),c(-1,1,0,0,0))
y4 <- data.frame(c(1,1,1,-1,-1),c(0,0,0,-1,1),
                 c(-1,-1,+1,0,0),c(-1,1,0,0,0))
y5 <- data.frame(c(1,1,1,-1,-1),c(-1,-1,+1,0,0),
                 c(0,0,0,-1,1),c(-1,1,0,0,0))
b1 <- balances(expenditures, y1)
b2 <- balances(expenditures, y5)
b1$balances
b2$balances

data(machineOperators)
sbp <- data.frame(c(1,1,-1,-1),c(-1,+1,0,0),
                 c(0,0,+1,-1))
balances(machineOperators, sbp)




