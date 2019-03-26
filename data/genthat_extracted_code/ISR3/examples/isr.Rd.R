library(ISR3)


### Name: isr
### Title: Iterative Sequential Regression
### Aliases: isr

### ** Examples

# simulation parameters
set.seed(100)
n <- 30
p <- 5 
missing <- 10

# generate a covar matrix
covarMatrix <- rWishart(1,p+1,diag(p))[,,1]

# simulation of variables under the variable relationships
U <- chol(covarMatrix)

X <- matrix(rnorm(n*p), nrow=n) %*% U

# make some data missing
X[sample(1:(n*p),size=missing)] <- NA

# specify relationships
fitMatrix <- matrix( c( 
  #  Covar2    CoVar1   Var1     Var2     Var3
     # 1. Var1
       TRUE,    TRUE,   FALSE,   FALSE,   FALSE,
     # 2. Var2
       TRUE,    TRUE,   FALSE,    FALSE,   FALSE,
     # 3. Var3
       TRUE,    TRUE,   TRUE,    TRUE,    FALSE 
 ),nrow=3,byrow=TRUE)

covarList <- c('Covar2', 'CoVar1', 'Var1', 'Var2','Var3')

# setup names
colnames(fitMatrix) <- covarList 
rownames(fitMatrix) <- covarList[-1:-2] 
colnames(X) <- covarList

XImputed <- isr(X,fitMatrix)




