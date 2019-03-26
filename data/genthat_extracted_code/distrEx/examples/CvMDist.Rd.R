library(distrEx)


### Name: CvMDist
### Title: Generic function for the computation of the Cramer - von Mises
###   distance of two distributions
### Aliases: CvMDist CvMDist-methods
###   CvMDist,UnivariateDistribution,UnivariateDistribution-method
###   CvMDist,numeric,UnivariateDistribution-method
### Keywords: distribution

### ** Examples

CvMDist(Norm(), UnivarMixingDistribution(Norm(1,2),Norm(0.5,3),
                 mixCoeff=c(0.2,0.8)))
CvMDist(Norm(), UnivarMixingDistribution(Norm(1,2),Norm(0.5,3),
                 mixCoeff=c(0.2,0.8)),mu=Norm())
CvMDist(Norm(), Td(10))
CvMDist(Norm(mean = 50, sd = sqrt(25)), Binom(size = 100))
CvMDist(Pois(10), Binom(size = 20)) 
CvMDist(rnorm(100),Norm())
CvMDist((rbinom(50, size = 20, prob = 0.5)-10)/sqrt(5), Norm())
CvMDist(rbinom(50, size = 20, prob = 0.5), Binom(size = 20, prob = 0.5))
CvMDist(rbinom(50, size = 20, prob = 0.5), Binom(size = 20, prob = 0.5), mu = Pois())



