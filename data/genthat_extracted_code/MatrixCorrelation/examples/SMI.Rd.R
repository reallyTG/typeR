library(MatrixCorrelation)


### Name: SMI
### Title: Similarity of Matrices Index (SMI)
### Aliases: SMI

### ** Examples

# Simulation
X1  <- scale( matrix( rnorm(100*300), 100,300), scale = FALSE)
usv <- svd(X1)
X2  <- usv$u[,-3] %*% diag(usv$d[-3]) %*% t(usv$v[,-3])

(smi <- SMI(X1,X2,5,5))
plot(smi, B = 1000 ) # default B = 10000

# Sensory analysis
data(candy)
plot( SMI(candy$Panel1, candy$Panel2, 3,3, projection = "Procrustes"),
    frame = c(2,2), B = 1000 ) # default B = 10000




