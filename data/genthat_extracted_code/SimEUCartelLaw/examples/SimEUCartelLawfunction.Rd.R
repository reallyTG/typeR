library(SimEUCartelLaw)


### Name: LEgame
### Title: Simulate the Legal Exemption Game
### Aliases: LEgame

### ** Examples

Par <- list(Phi=c(0.1,0.5), Rho=c(0.5,0.9), Ksi=c(0.05,0.3), Chi=c(0.1,0.4),
            M=c(0.2,1.2), G=c(0.05,0.2), A=c(0.1,0.3))
res <- LEgame(params=Par, m=100000)
print(aggResults(res))




