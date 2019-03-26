context("Tests power analysis code (power.rr.test)")

rm(list=ls())

####### FORCED DESIGN ####################

## Define design parameters
p <- 2/3  # probability of answering honestly in Forced Response Design
p1 <- 1/6 # probability of forced 'yes'
p0 <- 1/6 # probability of forced 'no'

test_that("power analysis works", {
  
  ### power.rr.test ###
  # changing designs
  power.rr.test(p = 2/3, p1 = 1/6, p0 = 1/6, n = 200, 
                presp = .2, presp.null = 0,
                design = "forced-known", sig.level = .01,
                type = "one.sample", alternative = "one.sided")
  
  power.rr.test(p = 2/3, n = 200, 
                presp = .2, presp.null = 0,
                design = "mirrored", sig.level = .01,
                type = "one.sample", alternative = "one.sided")
  
  power.rr.test(p = 2/3, n = 200, 
                presp = .2, presp.null = 0,
                design = "disguised", sig.level = .01,
                type = "one.sample", alternative = "one.sided")
  
  power.rr.test(p = 2/3, q = 1/3, n = 200, 
                presp = .2, presp.null = 0,
                design = "unrelated-known", sig.level = .01,
                type = "one.sample", alternative = "one.sided")
  
  power.rr.test(p = 2/3, p1 = 1/6, p0 = 1/6, r = .5, n = 200, 
                presp = .2, presp.null = 0,
                design = "forced-unknown", sig.level = .01,
                type = "one.sample", alternative = "one.sided")
  
  power.rr.test(p = 2/3, q = 1/3, r = .5, n = 200, 
                presp = .2, presp.null = 0,
                design = "unrelated-unknown", sig.level = .01,
                type = "one.sample", alternative = "one.sided")
  
  #n
  power.rr.test(p = 2/3, p1 = 1/6, p0 = 1/6, n = 2000, 
                presp = .2, presp.null = 0,
                design = "forced-known", sig.level = .01,
                type = "one.sample", alternative = "one.sided")
  
  #presp
  power.rr.test(p = 2/3, p1 = 1/6, p0 = 1/6, n = 200, 
                presp = .4, presp.null = 0,
                design = "forced-known", sig.level = .01,
                type = "one.sample", alternative = "one.sided")
  
  #presp.null
  power.rr.test(p = 2/3, p1 = 1/6, p0 = 1/6, n = 200, 
                presp = .2, presp.null = .1,
                design = "forced-known", sig.level = .01,
                type = "one.sample", alternative = "one.sided")
  
  #sig.level
  power.rr.test(p = 2/3, p1 = 1/6, p0 = 1/6, n = 200, 
                presp = .2, presp.null = 0,
                design = "forced-known", sig.level = .05,
                type = "one.sample", alternative = "one.sided")
  
  #prespT, prespC, prespT.null, prespC.null for type = "two.sample"
  power.rr.test(p = 2/3, p1 = 1/6, p0 = 1/6, n = 200, 
                prespT = .2, prespC = .1, prespT.null = 0, prespC.null = 0,
                design = "forced-known", sig.level = .01,
                type = "two.sample", alternative = "one.sided")
  
  power.rr.test(p = 2/3, p1 = 1/6, p0 = 1/6, n = 200, 
                prespT = .2, prespC = .1, prespT.null = .1, prespC.null = 0,
                design = "forced-known", sig.level = .01,
                type = "two.sample", alternative = "one.sided")
  
  #power (gives us n), 
  power.rr.test(p = 2/3, p1 = 1/6, p0 = 1/6, power = 0.9868872, 
                presp = .2, presp.null = 0,
                design = "forced-known", sig.level = .01,
                type = "one.sample", alternative = "one.sided")
  
  #error that n or power needs to be null
  #power.rr.test(p = 2/3, p1 = 1/6, p0 = 1/6, power = .8, n = 200,
  #              presp = .2, presp.null = 0,
  #              design = "forced-known", sig.level = .01,
  #              type = "one.sample", alternative = "one.sided")
  
  #alternative
  power.rr.test(p = 2/3, p1 = 1/6, p0 = 1/6, n = 200,
                presp = .2, presp.null = 0,
                design = "forced-known", sig.level = .01,
                type = "one.sample", alternative = "two.sided")
  
})
