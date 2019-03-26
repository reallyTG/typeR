library(ioanalysis)


### Name: toy.FullIOTable
### Title: An example data set to illustrate as.inputoutput
### Aliases: toy.FullIOTable toy.FullIOTable2
### Keywords: datasets

### ** Examples

set.seed(117)
# Creating the T (transaction) matrix

T11 <- matrix(sample(1:100, 25), ncol = 5, nrow = 5)
T12 <- matrix(sample(1:100, 25), ncol = 5, nrow = 5)
T21 <- matrix(sample(1:100, 25), ncol = 5, nrow = 5)
T22 <- matrix(sample(1:100, 25), ncol = 5, nrow = 5)
Trd <- rbind(cbind(T11,T12),cbind(T21,T22))
# Creating Labels
region <- c(rep("Hogwarts",5),rep("Narnia",5))
sector <- c("Pizza","Wii","Spaceships","Lightsabers","Minions")
sector <- c(sector,sector)
id <- rbind(region,sector)
blank <- matrix(NA, ncol = 2, nrow = 2)
Trd <- rbind( cbind(blank, id), cbind(t(id), Trd))
# Creating value added matrix
V <- matrix(sample(100:300, 30), ncol = 10, nrow = 3)
label <- matrix(c("Employee Compensation", "Proprietor Income", "Indirect Business Tax"),
                ncol = 1)
blank <- matrix(NA, ncol = 1, nrow = 3)
V <- cbind(blank, label, V)
# Creating final demand matrix
f <- matrix(sample(1:300, 80), ncol = 8, nrow = 10)
label <- c("Household", "Government", "Investment", " Exports")
label <- matrix(c(label, label), nrow = 1)
id <- rbind(region[c(1:4,6:9)], label)
f <- rbind(id, f)
# Creating total production
one.10 <- matrix(rep(1, 10), ncol = 1)
one.8 <- matrix(rep(1, 8), ncol = 1)
X <- matrix(as.numeric(Trd[3:12, 3:12]), nrow = 10)%*%one.10 + 
     matrix(as.numeric(f[3:12,]), nrow = 10)%*%one.8
label <- matrix(c(NA,"Total"))
X <- rbind(label, X)
# Creating imports (in this case it is a residual)
M <- matrix(NA, nrow = 1, ncol = 12)
one.3 <- matrix(rep(1, 3), ncol = 1)
M[1, 3:12] <- t(one.10)%*%matrix(as.numeric(Trd[3:12, 3:12]), nrow = 10) + 
              t(one.3)%*%matrix(as.numeric(V[,3:12]), nrow = 3)
M[1, 2] <- "Imports"
# Putting this beast together
blank <- matrix(NA, nrow=5, ncol = 9)
holder <- cbind(f, X)
holder <- rbind(holder, blank)
hold <- rbind(Trd, V, M, t(X))
toy.FullIOTable <- cbind(hold, holder)
# Creating an FV matrix
a <- matrix(round(80*runif(12)), nrow = 2, ncol = 6)
toy.FullIOTable[15:16, c(13:15, 17:19)] <- a



