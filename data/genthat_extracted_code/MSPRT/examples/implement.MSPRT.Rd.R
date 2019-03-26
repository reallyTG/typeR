library(MSPRT)


### Name: implement.MSPRT
### Title: Implementing a modified Sequential Probability Ratio Test
###   (MSPRT)
### Aliases: implement.MSPRT

### ** Examples


# the termination thresholds are obtained from design.MSPRT()

##test for a binomial proportion

x = c(0, 0, 0, 0, 1, 0, 1, 1, 1, 0, 1, 0, 0, 1, 0,
      0, 1, 0, 1, 1, 1, 1, 0, 0, 0, 1, 0, 1, 0, 0)

implement.MSPRT(obs = x, test.type = "prop.test", null = 0.2,
                term.thresh = 22.63, N.max = 30)


##z-test

x = c(4.060319, 5.275465, 3.746557, 7.392921, 5.494262,
      3.769297, 5.731144, 6.107487, 5.863672)
      
implement.MSPRT(obs = x, test.type = "z.test", null = 3,
                sigma0 = 1.5, term.thresh = 27.856, N.max = 30)


##t-test
x = c(1.738717, 5.076539, 1.116762, 3.105214, 5.567161, 2.095638,
      2.291750, 2.046943, 2.571340, 3.207162, 4.841446, 1.797331)

implement.MSPRT(obs = x, test.type = "t.test", null = 3,
                term.thresh = 32.702, N.max = 30)




