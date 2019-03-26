library(tvReg)


### Name: bw
### Title: Bandwidth Selection by Cross-Validation
### Aliases: bw bw.default bw.list

### ** Examples

##Generate data
tau <- seq(1:200)/200
beta <- data.frame(beta1 = sin(2*pi*tau), beta2 =  2*tau)
X <- data.frame(X1 = rnorm(200), X2 =  rchisq(200, df = 4))
error <- rt(200, df = 10)
y <- apply(X*beta, 1, sum) + error

##Select bandwidth by cross-validation
bw <- bw(X, y, est = "ll", tkernel = "Gaussian")

data( Kmenta, package = "systemfit" )

## x is a list of matrices containing the regressors, one matrix for each equation
x <- list()
x[[1]] <- Kmenta[, c("price", "income")]
x[[2]] <- Kmenta[, c("price", "farmPrice", "trend")]

## 'y' is a matrix with one column for each equation
y <- cbind(Kmenta$consump, Kmenta$consump)

## Select bandwidth by cross-validation
bw <- bw(x = x, y = y)

##One bandwidth per equation
print(bw)




