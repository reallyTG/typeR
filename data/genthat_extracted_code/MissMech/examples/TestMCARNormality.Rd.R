library(MissMech)


### Name: TestMCARNormality
### Title: Testing Homoscedasticity, Multivariate Normality, and Missing
###   Completely at Random
### Aliases: TestMCARNormality boxplot.testhomosc print.testhomosc
###   summary.testhomosc

### ** Examples


#-- Example 1: Data are MCAR and normally distributed
n <- 300
p <- 5
pctmiss <- 0.2
set.seed(1010)
y <- matrix(rnorm(n * p),nrow = n)
missing <- matrix(runif(n * p), nrow = n) < pctmiss
y[missing] <- NA
out <- TestMCARNormality(data=y)
print(out)

# --- Prints the p-value for both the Hawkins and the nonparametric test
summary(out)

# --- Uses more cases
#out1 <- TestMCARNormality(data=y, del.lesscases = 1)
#print(out1)

#---- performs multiple imputation
Out <- TestMCARNormality (data = y, imputation.number = 10)
summary(Out)
boxplot(Out)


#-- Example 2: Data are MCAR and non-normally distributed (t distributed with d.f. = 5)
n <- 300
p <- 5
pctmiss <- 0.2
set.seed(1010)
y <- matrix(rt(n * p, 5), nrow = n)
missing <- matrix(runif(n * p), nrow = n) < pctmiss
y[missing] <- NA
out <- TestMCARNormality(data=y)
print(out)

# Perform multiple imputation
#Out_m <- TestMCARNormality (data = y, imputation.number = 20)
#boxplot(Out_m)

# One may impute the data using a method other than the methods available in the package
# MissMech. If object "yimputed" set to be imputed data using other methods, e.g. k nearest
# neighbor imputation, then in MissMech it can be implemented as follow
#out_k <- TestMCARNormality(data = y, imputed.data = yimputed)
#print(out_k)

#-- Example 3: Data are MAR (not MCAR), but are normally distributed
n <- 300
p <- 5
r <- 0.3
mu <- rep(0, p)
sigma <- r * (matrix(1, p, p) - diag(1, p))+ diag(1, p)
set.seed(110)
eig <- eigen(sigma)
sig.sqrt <- eig$vectors %*%  diag(sqrt(eig$values)) %*%  solve(eig$vectors)
sig.sqrt <- (sig.sqrt + sig.sqrt) / 2
y <- matrix(rnorm(n * p), nrow = n) %*%  sig.sqrt
tmp <- y
for (j in 2:p){
  y[tmp[, j - 1] > 0.8, j] <- NA 
}
out <- TestMCARNormality(data = y, alpha =0.1)
print(out)

#-- Example 4: Multiple imputation; data are MAR (not MCAR), but are normally distributed
#n <- 300
#p <- 5
#pctmiss <- 0.2
#set.seed(1010)
#y <- matrix (rnorm(n * p), nrow = n)
#missing <- matrix(runif(n * p), nrow = n) < pctmiss
#y[missing] <- NA
#Out <- OrderMissing(y)
#y <- Out$data
#spatcnt <- Out$spatcnt
#g2 <- seq(spatcnt[1] + 1, spatcnt[2])
#g4 <- seq(spatcnt[3] + 1, spatcnt[4])
#y[c(g2, g4), ] <- 2 * y[c(g2, g4), ]
#out <- TestMCARNormality(data = y, imputation.number = 20)
#print(out)
#boxplot(out)

# Removing Groups 2 and 4

#y1= y[-seq(spatcnt[1]+1,spatcnt[2]),]
#out <- TestMCARNormality(data=y1,imputation.number = 20)
#print(out)
#boxplot(out)

#-- Example 5: Test of homoscedasticity for complete data
#n <- 50
#p <- 5
#r <- 0.4
#sigma <- r * (matrix(1, p, p) - diag(1, p)) + diag(1, p)
#set.seed(1010)
#eig <- eigen(sigma)
#sig.sqrt <- eig$vectors %*%  diag(sqrt(eig$values)) %*%  solve(eig$vectors)
#sig.sqrt <- (sig.sqrt + sig.sqrt) / 2
#y1 <- matrix(rnorm(n * p), nrow = n) %*%  sig.sqrt
#n <- 75
#p <- 5
#y2 <- matrix(rnorm(n * p), nrow = n)
#n <- 25
#p <- 5
#r <- 0
#sigma <- r * (matrix(1, p, p) - diag(1, p)) + diag(2, p)
#y3 <- matrix(rnorm(n * p), nrow = n) %*%  sqrt(sigma)
#ycomplete <- rbind(y1 ,y2 ,y3)
#y1 [ ,1] <- NA
#y2[,c(1 ,3)] <- NA
#y3 [ ,2] <- NA
#ygroup <- rbind(y1, y2, y3)
#out <- TestMCARNormality(data = ygroup, method = "Hawkins", imputed.data = ycomplete)
#print(out)

# ---- Example 6, real data
#data(agingdata)
#TestMCARNormality(agingdata, del.lesscases = 1)



