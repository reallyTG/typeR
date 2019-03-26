library(jipApprox)


### Name: jip_MonteCarlo
### Title: Approximate inclusion probabilities by Monte Carlo simulation
### Aliases: jip_MonteCarlo

### ** Examples

### Generate population data ---
N <- 20; n<-5

set.seed(0)
x <- rgamma(N, scale=10, shape=5)
y <- abs( 2*x + 3.7*sqrt(x) * rnorm(N) )

pik  <- n * x/sum(x)

### Approximate joint-inclusion probabilities
pikl <- jip_MonteCarlo(x=pik, n = n, replications = 100, design = "brewer")
pikl <- jip_MonteCarlo(x=pik, n = n, replications = 100, design = "tille")
pikl <- jip_MonteCarlo(x=pik, n = n, replications = 100, design = "maxEntropy")
pikl <- jip_MonteCarlo(x=pik, n = n, replications = 100, design = "randomSystematic")
pikl <- jip_MonteCarlo(x=pik, n = n, replications = 100, design = "systematic")
pikl <- jip_MonteCarlo(x=pik, n = n, replications = 100, design = "sampford")
pikl <- jip_MonteCarlo(x=pik, n = n, replications = 100, design = "poisson")

#Use an external function to draw samples
pikl <- jip_MonteCarlo(x=pik, n=n, replications=100,
                       design = sampling::UPmidzuno, design_pars = list(pik=pik))
#Write output on file after 50 and 100 replications
pikl <- jip_MonteCarlo(x=pik, n = n, replications = 100, design = "brewer",
                       write_on_file = TRUE, filename="test.txt", path=tempdir(), by = 50 )




