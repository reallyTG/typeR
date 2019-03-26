library(matrixpls)


### Name: matrixpls.sim
### Title: Monte Carlo simulations with matrixpls
### Aliases: matrixpls.sim

### ** Examples

if(!require(simsem)){
    print("This example requires the simsem package")
} else{

#
# Runs the second model from
#
# Aguirre-Urreta, M., & Marakas, G. (2013). Partial Least Squares and Models with Formatively 
# Specified Endogenous Constructs: A Cautionary Note. Information Systems Research. 
# doi:10.1287/isre.2013.0493

library(MASS)

X <- diag(15) 
X[upper.tri(X, diag=TRUE)] <- c(
  1.000,
  0.640, 1.000,
  0.640, 0.640, 1.000,
  0.640, 0.640, 0.640, 1.000,
  0.096, 0.096, 0.096, 0.096, 1.000,
  0.096, 0.096, 0.096, 0.096, 0.640, 1.000,
  0.096, 0.096, 0.096, 0.096, 0.640, 0.640, 1.000,
  0.096, 0.096, 0.096, 0.096, 0.640, 0.640, 0.640, 1.000,
  0.115, 0.115, 0.115, 0.115, 0.192, 0.192, 0.192, 0.192, 1.000,
  0.115, 0.115, 0.115, 0.115, 0.192, 0.192, 0.192, 0.192, 0.640, 1.000,
  0.115, 0.115, 0.115, 0.115, 0.192, 0.192, 0.192, 0.192, 0.640, 0.640,
  1.000,
  0.115, 0.115, 0.115, 0.115, 0.192, 0.192, 0.192, 0.192, 0.640, 0.640,
  0.640, 1.000,
  0.000, 0.000, 0.000, 0.000, 0.271, 0.271, 0.271, 0.271, 0.325, 0.325,
  0.325, 0.325, 1.000,
  0.000, 0.000, 0.000, 0.000, 0.271, 0.271, 0.271, 0.271, 0.325, 0.325,
  0.325, 0.325, 0.300, 1.000,
  0.000, 0.000, 0.000, 0.000, 0.271, 0.271, 0.271, 0.271, 0.325, 0.325,
  0.325, 0.325, 0.300, 0.300, 1.000
)
X <- X + t(X) - diag(diag(X)) 

colnames(X) <- rownames(X) <- c(paste("Y",1:12,sep=""),paste("X",1:3,sep=""))

# Print the population covariance matrix X to see that it is correct

X

# The estimated model in Lavaan syntax

analyzeModel <- "
ksi =~ Y1 + Y2 + Y3 + Y4
eta1 <~ X1 + X2 + X3
eta2 =~ Y5 + Y6 + Y7 + Y8
eta3 =~ Y9 + Y10 + Y11 + Y12

eta1 ~ ksi
eta2 ~ eta1
eta3 ~ eta1
"

# Only run 100 replications without bootstrap replications each so that the 
# example runs faster. Generate the data outside simsem because simsem
# does not support drawing samples from population matrix

dataSets <- lapply(1:100, function(x){
  mvrnorm(300,                 # Sample size
          rep(0,15),           # Means
          X)                   # Population covarancematrix
})

Output <- matrixpls.sim(model = analyzeModel, rawData = dataSets, boot.R=FALSE,
                        multicore = FALSE, stopOnError = TRUE)

summary(Output)


}



