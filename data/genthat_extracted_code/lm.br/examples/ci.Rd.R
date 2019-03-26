library(lm.br)


### Name: ci
### Title: Confidence Interval for the Changepoint
### Aliases: ci,Cpp_Clmbr-method ci

### ** Examples

#  Data for Patient B from Smith and Cook (1980)
y <- c(37.3, 47.1, 51.5, 67.6, 75.9, 73.3, 69.4, 61.5, 31.8, 19.4)
x <- 1:10
sc <- lm.br( y ~ x )
sc$ci()
sc $ ci( 0.90 )
sc $ ci( .99, 'af' )



