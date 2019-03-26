library(CerioliOutlierDetection)


### Name: hr05AdjustedDF
### Title: Adjusted Degrees of Freedom for Testing Robust Mahalanobis
###   Distances for Outlyingness
### Aliases: hr05AdjustedDF
### Keywords: robust multivariate

### ** Examples

hr05tester <- function(n,p) {
	a <- floor( (n+p+1)/2 )/n
	hr05AdjustedDF( n, p, a, ch99AsymptoticDF(n,p,a)$m.hat.asy, method="HR05" )
}
# compare to m_pred in table on page 941 of Hardin and Rocke (2005)
hr05tester(  50, 5)
hr05tester( 100,10)
hr05tester( 500,10)
hr05tester(1000,20)

# using default arguments
hr05tester <- function(n,p) {
	hr05AdjustedDF( n, p, method="HR05" )
}
# compare to m_pred in table on page 941 of Hardin and Rocke (2005)
hr05tester(  50, 5)
hr05tester( 100,10)
hr05tester( 500,10)
hr05tester(1000,20)

# Green and Martin (2014) improved method
hr05tester <- function(n,p) {
	hr05AdjustedDF( n, p, method="GM14" )
}
# compare to m_sim in table on page 941 of Hardin and Rocke (2005)
hr05tester(  50, 5)
hr05tester( 100,10)
hr05tester( 500,10)
hr05tester(1000,20)



