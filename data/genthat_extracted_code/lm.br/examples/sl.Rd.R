library(lm.br)


### Name: sl
### Title: Significance Level for Changepoint
### Aliases: sl,Cpp_Clmbr-method sl

### ** Examples

#  Data for Patient B from Smith and Cook (1980)
y <- c(37.3, 47.1, 51.5, 67.6, 75.9, 73.3, 69.4, 61.5, 31.8, 19.4)
x <- 1:10
sc <- lm.br( y ~ x )

sc $ sl( 6.1 )
## No test: 
sc $ sl( 6.1, 'mc' )
## End(No test)
## No test: 
sc $ sl( 6.1, 'mc', 0.00001 )
## End(No test)
sc $ sl( 6.1, 88.2, 'clr' )
sc $ sl( 6.1, 88.2, 'af' )
tmp <- sc $ sl( 6.1, 88.2, 'mc', 0.001, "B" )
tmp



