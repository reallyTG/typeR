library(grouped)


### Name: grouped
### Title: Regression for Grouped Data - Coarse Data
### Aliases: grouped
### Keywords: regression

### ** Examples

    
grouped(cbind(lo, up) ~ treat * x, link = "logit", data = Sdata)
    
grouped(equispaced(r, n) ~ x1 * x2, link = "logit", data = Seeds)

# See Figure 1 and Table 1 in Heitjan (1989)
y <- iris[iris$Species == "setosa", "Petal.Width"]
index <- cbind(seq(0.05, 0.55, 0.1), seq(0.15, 0.65, 0.1)) 
n <- length(y)
a <- b <- numeric(n)
for(i in 1:n){
    ind <- which(index[, 2] - y[i] > 0)[1]
    a[i] <- index[ind, 1]
    b[i] <- index[ind, 2]
}
summary(grouped(cbind(a, b) ~ 1))

# See Figure 1 and Table 1 in Heitjan (1989)
y <- iris[iris$Species == "setosa", "Petal.Length"]
index <- cbind(seq(0.95, 1.75, 0.2), seq(1.15, 1.95, 0.2)) 
n <- length(y)
a <- b <- numeric(n)
for(i in 1:n){
    ind <- which(index[, 2] - y[i] > 0)[1]
    a[i] <- index[ind, 1]
    b[i] <- index[ind, 2]
}
summary(grouped(cbind(a, b) ~ 1))




