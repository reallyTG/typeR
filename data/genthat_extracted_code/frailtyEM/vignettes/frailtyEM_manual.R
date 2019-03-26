### R code from vignette source 'frailtyEM_manual.Rnw'
### Encoding: UTF-8

###################################################
### code chunk number 1: roptions
###################################################
options(prompt="R> ")
options(width=60)


###################################################
### code chunk number 2: emfrail0
###################################################
library("frailtyEM")


###################################################
### code chunk number 3: emfrail1 (eval = FALSE)
###################################################
## 
## emfrail(formula, data, distribution, control, ...)


###################################################
### code chunk number 4: emfrail2
###################################################
str(emfrail_dist(dist = "gamma", theta = 2))


###################################################
### code chunk number 5: chd_head
###################################################
data("cgd")
cgd <- cgd[c("tstart", "tstop", "status", "id", "sex", "treat")]
head(cgd)


###################################################
### code chunk number 6: cgd2
###################################################
gam <- emfrail(Surv(tstart, tstop, status) ~ sex + treat + cluster(id),
  data = cgd)
summary(gam)


###################################################
### code chunk number 7: bladder2_cumhaz
###################################################
library("ggplot2")
library("egg")
p1 <- autoplot(gam, type = "pred",
               newdata = data.frame(sex = "male", treat = "rIFN-g")) +
  ggtitle("rIFN-g") +
  ylim(c(0, 2)) +
  guides(colour = FALSE)

p2 <- autoplot(gam, type = "pred",
               newdata = data.frame(sex = "male", treat = "placebo")) +
  ggtitle("placebo") + ylim(c(0, 2))



###################################################
### code chunk number 8: cgd_pred_plots
###################################################
pp <- ggarrange(p1,p2, nrow = 1)
ggsave(filename = "cgd_pred.pdf", plot = pp, width = 8, height = 3)


###################################################
### code chunk number 9: pred1 (eval = FALSE)
###################################################
## dat_pred <- data.frame(sex = c("male", "male"),
##   treat = c("rIFN-g", "placebo"))
## predict(gam, dat_pred)


###################################################
### code chunk number 10: pred_timechange
###################################################
dat_pred_b <- data.frame(sex = c("male", "male"),
  treat = c("placebo", "rIFN-g"),
  tstart = c(0, 200), tstop = c(200, Inf))

p <- autoplot(gam, type = "pred", newdata = dat_pred_b, individual = TRUE) +
  ggtitle("change placebo to rIFN-g at time 200")



###################################################
### code chunk number 11: cgd_pred_change
###################################################
pdf("cgd_treatdif.pdf", width = 5, height = 4)
p
dev.off()


###################################################
### code chunk number 12: bladder2_stable
###################################################
stab <- emfrail(Surv(tstart, tstop, status) ~ sex + treat + cluster(id),
  data = cgd,
  distribution = emfrail_dist(dist = "stable"))
summary(stab)


###################################################
### code chunk number 13: bladder2_hazardratios
###################################################
ig <- emfrail(Surv(tstart, tstop, status) ~ sex + treat + cluster(id),
  data = cgd,
  distribution = emfrail_dist(dist = "pvf"))

newdata <- data.frame(treat = c("placebo", "rIFN-g"),
  sex = c("male", "male"))

pl1 <- autoplot(gam, type = "hr", newdata = newdata) +
  ggtitle("gamma") +
  guides(colour = FALSE)


pl2 <- autoplot(stab, type = "hr", newdata = newdata) +
  ggtitle("PS") +
  guides(colour = FALSE)


pl3 <- autoplot(ig, type = "hr", newdata = newdata) +
  ggtitle("IG")

pp <- ggarrange(pl1, pl2, pl3, nrow = 1)


###################################################
### code chunk number 14: cgd_hr_plots
###################################################
ggsave(filename = "cgd_hr.pdf", width = 8, height = 3, plot = pp)


###################################################
### code chunk number 15: kidney1
###################################################
data("kidney")
kidney <- kidney[c("time", "status", "id", "age", "sex" )]
kidney$sex <- ifelse(kidney$sex == 1, "male", "female")
head(kidney)


###################################################
### code chunk number 16: kidneyb
###################################################
zph_t = emfrail_control(zph = TRUE)

m_gam <- emfrail(Surv(time, status) ~ age + sex + cluster(id),
  data = kidney, control = zph_t)

m_ps <- emfrail(Surv(time, status) ~ age + sex + cluster(id),
  data = kidney,
  distribution = emfrail_dist("stable"),
  control = zph_t)


###################################################
### code chunk number 17: kidneygam
###################################################
summary(m_gam, print_opts = list(frailty = FALSE))


###################################################
### code chunk number 18: kidneygstab
###################################################
summary(m_ps, print_opts = list(frailty = FALSE))


###################################################
### code chunk number 19: test_prop
###################################################
m_gam$zph
m_ps$zph


###################################################
### code chunk number 20: rats1
###################################################
data("rats")
head(rats)


###################################################
### code chunk number 21: rats_gamma
###################################################
summary(emfrail(Surv(time, status) ~ rx + sex + cluster(litter),
                data = rats))


###################################################
### code chunk number 22: rats2
###################################################
set.seed(1)
rats$tstart <- rexp(nrow(rats), rate = 1/50)
rats_lt <- rats[rats$tstart < rats$time, ]


###################################################
### code chunk number 23: rats3
###################################################
m1 <-
  emfrail(Surv(time, status) ~ rx  + cluster(litter),
          data = rats_lt)


###################################################
### code chunk number 24: rats3b
###################################################
m2 <-
  emfrail(Surv(tstart, time, status) ~ rx + sex + cluster(litter),
          data = rats_lt)


###################################################
### code chunk number 25: rats3c
###################################################
m3 <-
  emfrail(Surv(tstart, time, status) ~ rx + sex + cluster(litter),
          data = rats_lt,
          distribution = emfrail_dist(left_truncation = TRUE))


