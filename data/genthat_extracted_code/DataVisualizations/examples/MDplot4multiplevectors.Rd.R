library(DataVisualizations)


### Name: MDplot4multiplevectors
### Title: Mirrored Density plot (MD-plot)for Multiple Vectors
### Aliases: MDplot4multiplevectors
### Keywords: violin plot geom_violin PDE violin MDplot MD-plot MD Mirrored
###   Density plot Mirrored Density Density pdf probability density
###   function bean plot vase plot box plot

### ** Examples

## Don't show: 
MDplot4multiplevectors(list(runif(200, 1, 3),c(rnorm(200,0,1),rnorm(100,2.4,1))))

MDplot4multiplevectors(runif(200, 1, 3),c(rnorm(200,0,1),rnorm(100,2.4,1)))

MDplot4multiplevectors(rpois(100,1000))
## End(Don't show)
## No test: 

MDplot4multiplevectors(runif(20000, 1, 5),c(rnorm(20000,0,1),

rnorm(20000,2.6,1)),c(rnorm(2000,2.5,1)),rpois(25000,5),

Names=c('A','B','C','D'))

V=list(runif(20000, 1, 5),c(rnorm(20000,0,1),

rnorm(20000,2.6,1)),c(rnorm(2000,2.5,1)),rpois(25000,5))


MDplot4multiplevectors(V,Names=c('A','B','C','D'))
## End(No test)




