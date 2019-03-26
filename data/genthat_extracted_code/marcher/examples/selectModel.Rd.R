library(marcher)


### Name: selectModel
### Title: Select residual model
### Aliases: selectModel

### ** Examples

require(marcher)

# white noise example
Z1 <- rnorm(100) + 1i*rnorm(100)

# OU example
T <- 1:100
p.s2 <- c(tau.z = 5, tau.v = 0)
S2 <- outer(T, T, getCov, p=p.s2, model="ou")
Z2 <- mvrnorm2(n = 1, mu = rep(0,length(T)), S2) + 
     1i * mvrnorm2(n = 1, mu = rep(0,length(T)),  S2)

# OUF example
p.s3 <- c(tau.z = 5, tau.v = 2)
S3 <- outer(T, T, getCov, p=p.s3, model="ouf")
Z3 <- mvrnorm2(n = 1, mu = rep(0,length(T)), S3) + 
  1i * mvrnorm2(n = 1, mu = rep(0,length(T)),  S3)


# plot all three
par(mfrow=c(1,3), mar = c(2,2,2,2))
plot(Z1, asp=1, type="o")
plot(Z2, asp=1, type="o")
plot(Z3, asp=1, type="o")

# select models using 'ar' method (results might vary!)

selectModel(Z1, T = T, method = "ar", showtable = TRUE)
selectModel(Z2, T = T, method = "ar", showtable = TRUE)
selectModel(Z3, T = T, method = "ar", showtable = TRUE)

selectModel(Z1, T = T, method = "like", showtable = TRUE)
selectModel(Z2, T = T, method = "like", showtable = TRUE)
selectModel(Z3, T = T, method = "like", showtable = TRUE)

# repeat using irregular times (requiring "like" method)

T <- cumsum(rexp(100))

# white noise example
p.s1 <- c(tau.z = 0, tau.v = 0)
S1 <- outer(T, T, getCov, p=p.s1, model="wn")
Z1 <- mvrnorm2(n = 1, mu = rep(0,length(T)), S1) + 
  1i * mvrnorm2(n = 1, mu = rep(0,length(T)),  S1)

# OU example
p.s2 <- c(tau.z = 5, tau.v = 0)
S2 <- outer(T, T, getCov, p=p.s2, model="ou")
Z2 <- mvrnorm2(n = 1, mu = rep(0,length(T)), S2) + 
  1i * mvrnorm2(n = 1, mu = rep(0,length(T)),  S2)

# OUF example
p.s3 <- c(tau.z = 5, tau.v = 2)
S3 <- outer(T, T, getCov, p=p.s3, model="ouf")
Z3 <- mvrnorm2(n = 1, mu = rep(0,length(T)), S3) + 
  1i * mvrnorm2(n = 1, mu = rep(0,length(T)),  S3)

Z.list <- list(Z1, Z2, Z3)

# plot
par(mfrow=c(1,3), mar = c(2,2,2,2))
lapply(Z.list, function(z) plot(z, asp=1, type="o"))

# select model
lapply(Z.list, function(z) selectModel(z, T = T, method = "like", showtable = TRUE))



