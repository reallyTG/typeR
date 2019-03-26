library(RBesT)


### Name: decision2S
### Title: Decision Function for 2 Sample Designs
### Aliases: decision2S oc2Sdecision

### ** Examples


# see Gsponer et al., 2010
priorT <- mixnorm(c(1,   0, 0.001), sigma=88, param="mn")
priorP <- mixnorm(c(1, -49, 20   ), sigma=88, param="mn")
# the success criteria is for delta which are larger than some
# threshold value which is why we set lower.tail=FALSE
successCrit  <- decision2S(c(0.95, 0.5), c(0, 50), FALSE)
# the futility criterion acts in the opposite direction
futilityCrit <- decision2S(c(0.90)     , c(40),    TRUE)

print(successCrit)
print(futilityCrit)

# consider decision for specific outcomes
postP_interim <- postmix(priorP, n=10, m=-50)
postT_interim <- postmix(priorT, n=20, m=-80)
futilityCrit( postP_interim, postT_interim )
successCrit(  postP_interim, postT_interim )

# Binary endpoint with double criterion decision on log-odds scale
# 95% certain positive difference and an odds ratio of 2 at least
decL2 <- decision2S(c(0.95, 0.5), c(0, log(2)), lower.tail=FALSE, link="logit")
# 95% certain positive difference and an odds ratio of 3 at least
decL3 <- decision2S(c(0.95, 0.5), c(0, log(3)), lower.tail=FALSE, link="logit")

# data scenario
post1 <- postmix(mixbeta(c(1, 1, 1)), n=40, r=10)
post2 <- postmix(mixbeta(c(1, 1, 1)), n=40, r=18)

# positive outcome and a median odds ratio of at least 2 ...
decL2(post2, post1)
# ... but not more than 3
decL3(post2, post1)




