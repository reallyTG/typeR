library(MSPRT)


### Name: OC.MSPRT
### Title: Operating characteristics for a MSPRT
### Aliases: OC.MSPRT

### ** Examples


# the termination thresholds are obtained from design.MSPRT()

## test for a single proportion

#OC.MSPRT(test.type = "prop.test", null = 0.2,
#         term.thresh = 22.63, theta = 0.3, N.max = 30)



## z-test
## finding OC at theta  = 4

#OC.MSPRT(test.type = "z.test", null = 3, sigma0 = 1.5,
#         term.thresh = 27.856, theta = 4, N.max = 30)


## t-test

#OC.MSPRT(test.type = "t.test", null = 3, term.thresh = 32.702,
#         theta = 4, N.max = 30)




