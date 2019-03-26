library(spup)


### Name: genSample.JointScalar
### Title: Generating sample from cross-correlated variables described by a
###   scalar.
### Aliases: genSample.JointScalar

### ** Examples


set.seed(12345)
scalarUM <- defineUM(uncertain = TRUE, distribution = "norm",
                     distr_param = c(1, 2), id="Var1")                
scalarUM2 <- defineUM(uncertain = TRUE, distribution = "norm",
                      distr_param = c(3, 2), id="Var2")
scalarUM3 <- defineUM(uncertain = TRUE, distribution = "norm",
                      distr_param = c(10, 2.5), id="Var3")                
myMUM <- defineMUM(UMlist = list(scalarUM, scalarUM2, scalarUM3), 
               matrix(c(1,0.7,0.2,0.7,1,0.5,0.2,0.5,1), nrow = 3, ncol = 3))
my_sample <- genSample(myMUM, n = 10, samplemethod = "randomSampling", asList = FALSE)
my_sample  




