library(lsr)


### Name: standardCoefs
### Title: Standardised regression coefficients
### Aliases: standardCoefs

### ** Examples

### Example 1: simple linear regression ###
	
# data	
X1 <- c(0.69, 0.77, 0.92, 1.72, 1.79, 2.37, 2.64, 2.69, 2.84, 3.41)
Y  <- c(3.28, 4.23, 3.34, 3.73, 5.33, 6.02, 5.16, 6.49, 6.49, 6.05)

model1 <- lm( Y ~ X1 )  # run a simple linear regression
coefficients( model1 )  # extract the raw regression coefficients
standardCoefs( model1 ) # extract standardised coefficients


### Example 2: multiple linear regression ###

X2 <- c(0.19, 0.22, 0.95, 0.43, 0.51, 0.04, 0.12, 0.44, 0.38, 0.33) 
model2 <- lm( Y ~ X1 + X2 )   # new model
standardCoefs( model2 )       # standardised coefficients


### Example 3: interaction terms ### 

model3 <- lm( Y ~ X1 * X2 )
coefficients( model3 )
standardCoefs( model3 )

# Note that these beta values are equivalent to standardising all 
# three *regressors* including the interaction term X1:X2, not merely 
# standardising the two predictors X1 and X2.  




