library(epiR)


### Name: epi.interaction
### Title: Relative excess risk due to interaction in a case-control study
### Aliases: epi.interaction
### Keywords: univar

### ** Examples

## Data from Rothman and Keller (1972) evaluating the effect of joint exposure 
## to alcohol and tabacco on risk of cancer of the mouth and pharynx (cited in
## Hosmer and Lemeshow, 1992):

can <- c(rep(1, times = 231), rep(0, times = 178), rep(1, times = 11), 
   rep(0, times = 38))
smk <- c(rep(1, times = 225), rep(0, times = 6), rep(1, times = 166), 
   rep(0, times = 12), rep(1, times = 8), rep(0, times = 3), rep(1, times = 18), 
   rep(0, times = 20))
alc <- c(rep(1, times = 409), rep(0, times = 49))
dat <- data.frame(alc, smk, can)

## Table 2 of Hosmer and Lemeshow (1992):
dat.glm01 <- glm(can ~ alc + smk + alc:smk, family = binomial, data = dat)
summary(dat.glm01)

## Rothman defines an alternative coding scheme to be employed for
## parameterising an interaction term. Using this approach, instead of using
## two risk factors and one product term to represent the interaction (as 
## above) the risk factors are combined into one variable with (in this case)
## four levels:

## a.neg b.neg: 0 0 0
## a.pos b.neg: 1 0 0
## a.neg b.pos: 0 1 0
## a.pos b.pos: 0 0 1

dat$d <- rep(NA, times = nrow(dat))
dat$d[dat$alc == 0 & dat$smk == 0] <- 0
dat$d[dat$alc == 1 & dat$smk == 0] <- 1
dat$d[dat$alc == 0 & dat$smk == 1] <- 2
dat$d[dat$alc == 1 & dat$smk == 1] <- 3
dat$d <- factor(dat$d)

## Table 3 of Hosmer and Lemeshow (1992):
dat.glm02 <- glm(can ~ d, family = binomial, data = dat)
summary(dat.glm02)

epi.interaction(model = dat.glm02, coeff = c(2,3,4), type = "RERI", 
   conf.level = 0.95)
epi.interaction(model = dat.glm02, coeff = c(2,3,4), type = "APAB", 
   conf.level = 0.95)
epi.interaction(model = dat.glm02, coeff = c(2,3,4), type = "S", 
   conf.level = 0.95)

## Page 455 of Hosmer and Lemeshow (1992):
## RERI: 3.73 (95% CI -1.84 -- 9.32).
## AP[AB]: 0.41 (95% CI -0.07 -- 0.90).
## S: 1.87 (95% CI 0.64 -- 5.41).



