library(survidm)


### Name: coxidm
### Title: Fit proportional hazards regression model in each transition of
###   the Illness-Death Model.
### Aliases: coxidm coxidm

### ** Examples

  cmm1 <- coxidm(survIDM(time1, event1, Stime, event) ~ age, data = colonIDM)
  summary(cmm1, conf.level = 0.95)

  cmm2 <- coxidm(survIDM(time1, event1, Stime, event) ~ rx + sex + age + nodes,
                 data = colonIDM)
  summary(cmm2)

  cmm3 <- coxidm(survIDM(time1, event1, Stime, event) ~ rx + sex + age + nodes,
                 data = colonIDM, semiMarkov = TRUE)
  summary(cmm3)



