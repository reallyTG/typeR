library(fungible)


### Name: enhancement
### Title: Find OLS Regression Coefficients that Exhibit Enhancement
### Aliases: enhancement
### Keywords: datagen

### ** Examples

## Example: For a given predictor correlation  matrix (R) generate 
## regression coefficient vectors that produce enhancement (br - rr > 0)

## Predictor correlation matrix
R <- matrix(c( 1,  .5, .25,
              .5, 1,   .30,
              .25, .30, 1), 3, 3) 
 
## Model coefficient of determination
Rsq <- .60
 
output<-enhancement(R, br = Rsq, rr =.40) 
 
r <- output$r
b <- output$b
  
##Standardized regression coefficients
print(t(b)) 

##Predictor-criterion correlations
print(t(r)) 
 
##Coefficient of determinations (b'r)
print(t(b) %*% r)

##Sum of squared correlations (r'r)
print(t(r) %*% r)



