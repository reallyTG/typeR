library(modcmfitr)


### Name: fitDirichlet
### Title: Fit Dirichlet distribution
### Aliases: fitDirichlet
### Keywords: Dirichlet

### ** Examples

Outcomes <- c("Remission","Progression","Dead")
RawData <- matrix(data = c(0.43, 0.55, 0.65,
                          0.16, 0.27, 0.46,
                          0.03, 0.18, 0.23
           ),ncol=3,byrow=TRUE)

SearchParams <- c(10000,100) #number of iterations, max number of searches

Quantiles <- c(0.025,0.5,0.975) # example here is 95% credibility limits and median.

fitDirichlet(Outcomes, RawData, SearchParams, Quantiles)



