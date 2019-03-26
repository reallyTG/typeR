library(survidm)


### Name: summary.cmm
### Title: Summarizing fits of 'cmm' class
### Aliases: summary.cmm print.cmm

### ** Examples

  cmm1 <- coxidm(survIDM(time1, event1, Stime, event) ~ age, data = colonIDM)
  summary(cmm1, conf.level = 0.95)

  cmm2 <- coxidm(survIDM(time1, event1, Stime, event) ~ rx + sex + age + nodes,
                 data = colonIDM)
  summary(cmm2)

  cmm3 <- coxidm(survIDM(time1, event1, Stime, event) ~ rx + sex + age + nodes,
                 data = colonIDM, semiMarkov = TRUE)
  summary(cmm3)



