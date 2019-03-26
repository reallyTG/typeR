library(multiway)


### Name: USalcohol
### Title: United States Alcohol Consumption Data (1970-2013)
### Aliases: USalcohol
### Keywords: datasets

### ** Examples

# load data and print first six rows
data(USalcohol)
head(USalcohol)

# form tensor (time x variables x state)
Xbev <- with(USalcohol, tapply(beverage/pop21, list(year, type, state), c))
Xeth <- with(USalcohol, tapply(ethanol/pop21, list(year, type, state), c))
X <- array(0, dim=c(44, 6, 51))
X[, c(1,3,5) ,] <- Xbev
X[, c(2,4,6) ,] <- Xeth
dnames <- dimnames(Xbev)
dnames[[2]] <- c(paste0(dnames[[2]],".bev"), paste0(dnames[[2]],".eth"))[c(1,4,2,5,3,6)]
dimnames(X) <- dnames

# center each variable across time (within state)
Xc <- ncenter(X, mode = 1)

# scale each variable to have mean square of 1 (across time and states)
Xs <- nscale(Xc, mode = 2)

# fit parafac model with 3 factors
set.seed(1)
pfac <- parafac(Xs, nfac = 3, nstart = 1)

# fit parafac model with functional constraints
set.seed(1)
pfacF <- parafac(Xs, nfac = 3, nstart = 1, 
                 const = c("smooth", NA, NA))

# fit parafac model with functional and structural constraints
Bstruc <- matrix(c(rep(c(TRUE,FALSE), c(2,4)), 
                   rep(c(FALSE,TRUE,FALSE), c(2,2,2)),
                   rep(c(FALSE,TRUE), c(4,2))), nrow=6, ncol=3)
set.seed(1)
pfacFS <- parafac(Xs, nfac = 3, nstart = 1, 
                  const = c("smooth", NA, NA), Bstruc = Bstruc)




