library(MSPRT)


### Name: design.MSPRT
### Title: Designing a modified Sequential Probability Ratio Test (MSPRT)
### Aliases: design.MSPRT

### ** Examples


## test for a binomial proportion

# can sequentially observe every sample where max available
# sample size is 30
#design.MSPRT(test.type="prop.test", side = "right", null = 0.2, N.max = 30)


# can sequentially observe every fifth sample where max available
# sample size is 30
#design.MSPRT(test.type="prop.test", side = "right", null = 0.2, N.max = 30,
#             batch.seq = seq(5,30, by = 5))
               

               
## Z-test

# can sequentially observe every sample where max available
# sample size is 30
#design.MSPRT(test.type="z.test", side = "right", null = 3, sigma0 = 1.5,
#             N.max = 30)


# can sequentially observe every fifth sample where max available
# sample size is 30
#design.MSPRT(test.type="z.test", side = "right", null = 3, sigma0 = 1.5,
#             N.max = 30, batch.seq = seq(5,30, by = 5))
               


## T-test

# can sequentially observe every sample where max available
# sample size is 30
#design.MSPRT(test.type="t.test", side = "right", null = 3, N.max = 30)


# can sequentially observe every fifth sample where max available
# sample size is 30
#design.MSPRT(test.type="t.test", side = "right", null = 3, N.max = 30,
#             batch.seq = seq(5,30, by = 5))




