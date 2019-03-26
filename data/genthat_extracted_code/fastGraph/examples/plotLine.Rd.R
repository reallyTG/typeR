library(fastGraph)


### Name: plotLine
### Title: X-Y Plotting with Simple Linear Regression Line and Equation
### Aliases: plotLine
### Keywords: scatter plot simple linear regression

### ** Examples

x <- c( 2, 6, 5, -3, 11, 3 )
y <- c( 16, 12, 19, -13, 27, 5 )
plotLine( x, y )

d <- data.frame( x=c( 2, 7, 9, 15, 12 ), y=c( 45, 32, 22, 15, 19 ) )
plotLine( y~x, data=d, col=c("blue","orange") )

plotLine( y~x, data=d, xlab="TIME", ylab="EXPENSE", digits.intercept=3, digits.slope=4 )



