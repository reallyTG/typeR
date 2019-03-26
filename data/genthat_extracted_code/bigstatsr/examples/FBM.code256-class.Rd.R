library(bigstatsr)


### Name: FBM.code256-class
### Title: Class FBM.code256
### Aliases: FBM.code256-class FBM.code256_RC FBM.code256 add_code256

### ** Examples

X <- FBM(10, 10, type = "raw")
X[] <- sample(as.raw(0:3), size = length(X), replace = TRUE)
X[]

code <- rep(NA_real_, 256)
code[1:3] <- c(1, 3, 5)

X.code <- add_code256(X, code)
X.code[]

# Or directly
X.code2 <- FBM.code256(10, 10, code, init = sample(as.raw(0:3), 100, TRUE))
X.code2[]

# Copy the FBM with another code
X.code3 <- X.code$copy(code = rnorm(256))
stopifnot(all.equal(X.code$code256, code))




