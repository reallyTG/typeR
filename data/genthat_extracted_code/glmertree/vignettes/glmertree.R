### R code from vignette source 'glmertree.Rnw'

###################################################
### code chunk number 1: preliminaries
###################################################
library("glmertree")
options(width = 70, prompt = "R> ", continue = "+  ")


###################################################
### code chunk number 2: glmertree.Rnw:60-61 (eval = FALSE)
###################################################
## install.packages("glmertree")


###################################################
### code chunk number 3: glmertree.Rnw:66-67 (eval = FALSE)
###################################################
## install.packages("glmertree", repos = "http://R-Forge.R-project.org")


###################################################
### code chunk number 4: glmertree.Rnw:72-73 (eval = FALSE)
###################################################
## library("glmertree")


###################################################
### code chunk number 5: glmertree.Rnw:81-83
###################################################
data("DepressionDemo", package = "glmertree")
summary(DepressionDemo)


###################################################
### code chunk number 6: glmertree.Rnw:90-92
###################################################
lmm_tree <- lmertree(depression ~ treatment | cluster |
  age + duration + anxiety, data = DepressionDemo)


###################################################
### code chunk number 7: glmertree.Rnw:99-101
###################################################
glmm_tree <- glmertree(depression_bin ~ treatment | cluster |
  age + duration + anxiety, data = DepressionDemo, family = binomial)


###################################################
### code chunk number 8: glmertree.Rnw:106-107 (eval = FALSE)
###################################################
## plot(lmm_tree)


###################################################
### code chunk number 9: glmertree.Rnw:113-114
###################################################
plot(lmm_tree, which = "tree")


###################################################
### code chunk number 10: glmertree.Rnw:122-123
###################################################
plot(lmm_tree, which = "ranef")


###################################################
### code chunk number 11: glmertree.Rnw:138-141
###################################################
print(lmm_tree)
coef(lmm_tree)
ranef(lmm_tree)


###################################################
### code chunk number 12: glmertree.Rnw:146-147
###################################################
predict(lmm_tree, newdata = DepressionDemo[1:7,])


###################################################
### code chunk number 13: glmertree.Rnw:152-153
###################################################
predict(lmm_tree, newdata = DepressionDemo[1:7, -3], re.form = NA)


###################################################
### code chunk number 14: glmertree.Rnw:161-165 (eval = FALSE)
###################################################
## resids <- residuals(lmm_tree)
## preds <- predict(lmm_tree)
## plot(factor(DepressionDemo$cluster), resids)
## scatter.smooth(preds, resids)


###################################################
### code chunk number 15: glmertree.Rnw:171-174
###################################################
resids <- residuals(lmm_tree)
preds <- predict(lmm_tree)
plot(factor(DepressionDemo$cluster), resids, xlab = "Cluster", ylab = "Residuals")


###################################################
### code chunk number 16: glmertree.Rnw:176-177
###################################################
scatter.smooth(preds, resids, xlab = "Predicted values", ylab = "Residuals")


###################################################
### code chunk number 17: appendix1
###################################################
set.seed(123)
treatment <- rbinom(n = 150, size = 1, prob = .5)
duration <- round(rnorm(150, mean = 7, sd = 3))
anxiety <- round(rnorm(150, mean = 10, sd = 3))
age <- round(rnorm(150, mean = 45, sd = 10))
error <- rnorm(150, 0, 2)


###################################################
### code chunk number 18: appendix2
###################################################
cluster <- error + rnorm(150, 0, 6)
rand_int <- sort(rep(rnorm(10, 0, 1), each = 15))
rand_int[order(cluster)] <- rand_int 
error <- error - rand_int
cluster[order(cluster)] <- rep(1:10, each = 15)


###################################################
### code chunk number 19: appendix3
###################################################
node3t1 <- ifelse(duration <= 8 & anxiety <= 10 & treatment == 0, -2, 0)
node3t2 <- ifelse(duration <= 8 & anxiety <= 10 & treatment == 1, 2, 0)
node5t1 <- ifelse(duration > 8 & treatment == 0, 2.5, 0)
node5t2 <- ifelse(duration > 8 & treatment == 1, -2.5, 0)


###################################################
### code chunk number 20: appendix4
###################################################
depression <- round(9 + node3t1 + node3t2 + node5t1 + node5t2 +
  .4 * treatment + error + rand_int)
depression_bin <- factor(as.numeric(depression > 9))


###################################################
### code chunk number 21: appendix5
###################################################
treatment <- factor(treatment, labels = c("Treatment 1", "Treatment 2"))
DepressionDemo <- data.frame(depression, treatment, cluster,
  age, anxiety, duration, depression_bin)


