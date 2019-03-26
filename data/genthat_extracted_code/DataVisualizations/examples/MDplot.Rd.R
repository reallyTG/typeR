library(DataVisualizations)


### Name: MDplot
### Title: Mirrored Density plot (MD-plot): Visualization for a
###   Boxplot-like Shape of the PDF
### Aliases: MDplot
### Keywords: violin plot PDE violin MDplot MD Mirrored Density plot
###   Mirrored Density Density pdf probability density function bean plot
###   vase plot box plot

### ** Examples

## Don't show: 
x <- cbind(A = runif(200, 1, 3), B = c(rnorm(100,0,1),rnorm(100,2.4,1)))
MDplot(x)
## End(Don't show)
## No test: 
x <- cbind(A = runif(20000, 1, 3), B = c(rnorm(10000,0,1),rnorm(10000,2.6,1)))
MDplot(x)
## End(No test)
#Check for significance
## No test: 
#requireNamespace('diptest')
#diptest::dip.test(x[,1])$p.value
#diptest::dip.test(x[,2])$p.value
## End(No test)



