library(pirate)


### Name: gem_test
### Title: Implement Fitted GEM criterior on a Data Set
### Aliases: gem_test gem_test_sample gem_test_simsample

### ** Examples

#constructing the covariance matrix
co <- matrix(0.2, 10, 10)
diag(co) <- 1
dataEx <- data_generator1(d = 0.3, R2 = 0.5, v2 = 1, n = 300, 
                         co = co, beta1 = rep(1,10),inter = c(0,0))
#fit the GEM
dat <- dataEx[[1]]
model_nu <- gem_fit(dat = dat, method = "nu")

#calculate the population average benefit in the data sample
gem_test_sample(dat,model_nu[[2]])

#calculate the population average benefit when outcome under both treatment conditions 
#is known, usually in a simulated sample
bigData <- data_generator3(n = 1000,co = co,bet =dataEx[[2]], inter = c(0,0)) 
gem_test_simsample(bigData[[1]],bigData[[2]],bigData[[3]],model_nu[[2]])



