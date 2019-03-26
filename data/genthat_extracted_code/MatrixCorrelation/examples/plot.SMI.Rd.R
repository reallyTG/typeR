library(MatrixCorrelation)


### Name: plot.SMI
### Title: Result functions for the Similarity of Matrices Index (SMI)
### Aliases: plot.SMI print.SMI summary.SMI is.signif print.SMI summary.SMI
###   is.signif

### ** Examples

X1  <- scale( matrix( rnorm(100*300), 100,300), scale = FALSE)
usv <- svd(X1)
X2  <- usv$u[,-3] %*% diag(usv$d[-3]) %*% t(usv$v[,-3])

smi <- SMI(X1,X2,5,5)
plot(smi, B = 1000) # default B = 10000
print(smi)
summary(smi)
is.signif(smi, B = 1000) # default B = 10000




