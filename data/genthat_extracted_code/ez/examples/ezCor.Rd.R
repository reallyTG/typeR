library(ez)


### Name: ezCor
### Title: Compute and plot an information-dense correlation matrix
### Aliases: ezCor

### ** Examples

########
# Set up some fake data
########
library(MASS)
N=100

#first pair of variables
variance1=1
variance2=2
mean1=10
mean2=20
rho = .8
Sigma=matrix(
    c(
        variance1
        , sqrt(variance1*variance2)*rho
        , sqrt(variance1*variance2)*rho
        , variance2
    )
    , 2
    , 2
)
pair1=mvrnorm(N,c(mean1,mean2),Sigma,empirical=TRUE)

#second pair of variables
variance1=10
variance2=20
mean1=100
mean2=200
rho = -.4
Sigma=matrix(
    c(
        variance1
        , sqrt(variance1*variance2)*rho
        , sqrt(variance1*variance2)*rho
        , variance2
    )
    , 2
    , 2
)
pair2=mvrnorm(N,c(mean1,mean2),Sigma,empirical=TRUE)

my_data=data.frame(cbind(pair1,pair2))

########
# Now plot
########
p = ezCor(
    data = my_data
)
print(p)

#you can modify the default colours of the
##correlation coefficients as follows
library(ggplot2)
p = p + scale_colour_manual(values = c('red','blue'))
print(p)
#see the following for alternatives:
# http://had.co.nz/ggplot2/scale_manual.html
# http://had.co.nz/ggplot2/scale_hue.html
# http://had.co.nz/ggplot2/scale_brewer.html




