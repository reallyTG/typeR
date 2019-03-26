### R code from vignette source 'inference.Rnw'

###################################################
### code chunk number 1: inference.Rnw:50-51
###################################################
options(prompt="R> ", width=77, digits=4, useFancyQuotes=FALSE)


###################################################
### code chunk number 2: inference.Rnw:109-117
###################################################
library(synthpop)
ods <- SD2011[, c("smoke", "sex", "age", "edu")]
levels(ods$edu) <- c("NONE", "VOC", "SEC", "HIGH")
s1 <- syn(ods, seed = 1234)
summary(glm(smoke ~ sex + age + edu + sex * edu, 
  data = s1$syn, family = "binomial"))
summary(glm.synds(smoke ~ sex + age + edu + sex * edu, 
  data = s1, family = "binomial"))


###################################################
### code chunk number 3: inference.Rnw:122-125
###################################################
s2 <- syn(ods, seed = 1234,visit.sequence=c("smoke","edu","age"))
summary(glm.synds(smoke ~ sex + age + edu + sex * edu, 
data = s2, family = "binomial"))


###################################################
### code chunk number 4: inference.Rnw:134-144
###################################################
s3 <- syn(ods, seed = 1234, k = 500)
# original data
summary(glm(smoke ~ sex + age + edu + sex * edu, 
  data = ods, family = "binomial"))
# synthetic data
summary(glm(smoke ~ sex + age + edu + sex * edu, 
  data = s3$syn, family = "binomial"))
# estimating original from synthetic
summary(glm.synds(smoke ~ sex + age + edu + sex * edu, 
  data = s3, family = "binomial"))


###################################################
### code chunk number 5: inference.Rnw:155-157
###################################################
summary(glm.synds(smoke ~ sex + age + edu + sex * edu, 
  data = s1, family = "binomial"), population.inference = TRUE)


###################################################
### code chunk number 6: inference.Rnw:165-168
###################################################
s4 <- syn(ods, seed = 5678, proper = TRUE)
summary(glm.synds(smoke ~ sex + age + edu + sex * edu, 
  data = s4, family = "binomial"), population.inference = TRUE)


###################################################
### code chunk number 7: inference.Rnw:175-178
###################################################
s5 <- syn(ods, seed = 5678, m = 10, proper = TRUE, print.flag = FALSE)
summary(glm.synds(smoke ~ sex + age + edu + sex * edu, 
  data = s5, family = "binomial"), population.inference = TRUE)


###################################################
### code chunk number 8: inference.Rnw:190-199
###################################################
s6 <- syn(ods, seed = 910011, m = 6, 
  method = c("", "cart", "cart", "cart"), print.flag = FALSE) 

summary(glm.synds(smoke ~ sex + age + edu + sex * edu, 
  data = s6, family = "binomial"), population.inference = TRUE, 
  incomplete = TRUE)

summary(glm.synds(smoke ~ sex + age + edu + sex * edu, 
  data = s6, family = "binomial"), population.inference = TRUE)


###################################################
### code chunk number 9: inference.Rnw:208-211
###################################################
summary(glm.synds(smoke ~ sex + age + edu + sex * edu, 
  data = s6, family = "binomial"), population.inference = TRUE, 
  incomplete = TRUE, msel = 1:2)


###################################################
### code chunk number 10: inference.Rnw:242-249
###################################################
ods <- ods[!is.na(ods$smoke), ] # remove 10 observations with missing "smoke"
s7 <- syn.strata(ods, m = 5, method = "parametric", strata = "smoke", 
  seed = 5678, visit.sequence = c("smoke", "sex", "edu", "age"), 
  print.flag = FALSE, tab.strataobs = FALSE)
f7 <- glm.synds(smoke ~ sex  + edu + sex * edu, data = s7, 
  family = "binomial")
compare(f7, ods, plot.intercept = TRUE, plot = "coef") 


###################################################
### code chunk number 11: inference.Rnw:257-263
###################################################
ods <- ods[!is.na(ods$smoke), ] # remove 10 observationswith missing "smoke"
s8 <- syn(ods, m = 5, seed = 5678, 
  visit.sequence = c("sex", "edu", "age", "smoke"), print.flag = FALSE)
f8 <- glm.synds(smoke ~ sex  + age + edu + sex * age, data = s8, 
  family = "binomial")
compare(f8, ods)  


###################################################
### code chunk number 12: inference.Rnw:277-282
###################################################
s9 <- syn(ods, m = 5, seed = 5678, method = "sample", 
  visit.sequence = c("sex", "edu", "age", "smoke"), print.flag = FALSE)
f9 <- glm.synds(smoke ~ sex  + age + edu + sex * edu, data = s9, 
  family = "binomial")
compare(f9, ods)


###################################################
### code chunk number 13: inference.Rnw:289-295
###################################################
s10 <- syn(ods, seed = 910011, m = 20, method = c("", "", "cart", "cart"), 
  print.flag = FALSE) 
f10 <- glm.synds(smoke ~ sex + age + edu + sex * edu, data = s10, 
  family = "binomial")
compare(f10, ods)
compare(f10, ods, incomplete = TRUE)


###################################################
### code chunk number 14: inference.Rnw:316-329
###################################################
ods <- ods[!is.na(ods$smoke), ]
s11 <- syn.strata(ods, m = 5, visit.sequence = c(4, 1, 2), 
  method = "parametric", strata = "smoke", seed = 5678, print.flag = FALSE)
s12 <- syn.strata(ods, m = 5, visit.sequence = c(4, 1, 2), 
  method = "parametric", strata = "smoke", seed = 1234, proper = TRUE, 
  print.flag = FALSE, tab.strataobs = FALSE)
 
f11 <- glm.synds(smoke ~ sex  + edu + sex * edu, data = s11, 
  family = "binomial")
compare(f11, ods, plot.intercept = TRUE, plot = "coef") 
f12 <- glm.synds(smoke ~ sex  + edu + sex * edu, data = s12, 
  family = "binomial")
compare(f12, ods, plot.intercept = TRUE)


###################################################
### code chunk number 15: inference.Rnw:338-349
###################################################
s13 <- syn(ods, m = 5, seed = 9101112, method = "parametric",
  print.flag = FALSE)
s14 <- syn(ods, m = 5, seed = 1415, method = "parametric", 
  proper = TRUE, print.flag = FALSE)

f13 <- glm.synds(smoke ~ sex  + edu + age + sex * edu, data = s13, 
  family = "binomial")
compare(f13, ods, plot.intercept = TRUE, plot = "coef") 
f14 <- glm.synds(smoke ~ sex  + edu + age + sex * edu, data = s14, 
  family = "binomial")
compare(f14, ods, plot.intercept = TRUE) 


###################################################
### code chunk number 16: inference.Rnw:367-374
###################################################
s15 <- syn(ods, proper = TRUE, print.flag = FALSE)
f15 <- glm.synds(smoke ~ sex  + edu  + sex * edu, data = s15, 
  family = "binomial")

compare(f15, ods, plot.intercept = TRUE, plot = "coef") 
compare(f15, ods, plot.intercept = TRUE, population.inference = TRUE, 
  plot = "coef")


