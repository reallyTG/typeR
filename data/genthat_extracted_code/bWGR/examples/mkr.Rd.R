library(bWGR)


### Name: WGR3 (MKR)
### Title: Multivariate Kernel Regression
### Aliases: mkr Hmat

### ** Examples

# G matrix
data(tpod)
G = tcrossprod(gen)
G = G/mean(diag(G))

# Phenotypes
Y1 = rnorm(196,y,.1)
Y2 = rnorm(196,y,.2)
Y3 = rnorm(196,y,.3)
Phe = cbind(Y1,Y2,Y3)

# Fit model
test = mkr(Phe,G)

# Genetic correlation
cov2cor(test$VA)

# Environmental correlation
cov2cor(test$VE)

# Heritabilies
diag(test$VA/(test$VA+test$VE))

# Goodness of fit
diag(cor(Phe,test$BV))



