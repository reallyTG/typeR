### R code from vignette source 'plink-UD.Rnw'

###################################################
### code chunk number 1: plink-UD.Rnw:12-15
###################################################
library("plink")
options(prompt = "R> ", continue = "+  ", width = 70,
  digits = 4, show.signif.stars = FALSE, useFancyQuotes = FALSE)


###################################################
### code chunk number 2: plink-UD.Rnw:385-396
###################################################
x <- matrix(c(
    0.844, -1.630,  0.249,     NA,     NA,    NA,     NA,     NA,     NA,    NA,
    1.222, -0.467, -0.832,  0.832,     NA,    NA,     NA,     NA,     NA,    NA,
    1.101, -0.035, -1.404, -0.285,  0.541, 1.147,     NA,     NA,     NA,    NA,
    1.076,  0.840,  0.164,     NA,     NA,    NA,     NA,     NA,     NA,    NA,
    0.972, -0.140,  0.137,     NA,     NA,    NA,     NA,     NA,     NA,    NA,
    0.905,  0.522, -0.469, -0.959,     NA, 0.126, -0.206, -0.257,  0.336,    NA,
    0.828,  0.375, -0.357, -0.079, -0.817, 0.565,  0.865, -1.186, -1.199, 0.993,
    1.134,  2.034,  0.022,     NA,     NA,    NA,     NA,     NA,     NA,    NA,
    0.871,  1.461, -0.279,  0.279,     NA,    NA,     NA,     NA,     NA,    NA),
  9, 10, byrow = TRUE)


###################################################
### code chunk number 3: plink-UD.Rnw:398-399
###################################################
round(x, 2)


###################################################
### code chunk number 4: plink-UD.Rnw:407-432
###################################################
a <- round(matrix(c(
    0.844, NA,    NA,     NA,     NA,
    1.222, NA,    NA,     NA,     NA,
    1.101, NA,    NA,     NA,     NA,
    1.076, NA,    NA,     NA,     NA,
    0.972, NA,    NA,     NA,     NA,
    0.905, 0.522, -0.469, -0.959, NA, 
    0.828, 0.375, -0.357, -0.079, -0.817, 
    1.134, NA,    NA,     NA,     NA,
    0.871, NA,    NA,     NA,     NA),
  9, 5, byrow = TRUE), 2)

b <- round(matrix(c(
    -1.630,     NA,     NA,     NA,    NA,     
    -0.467, -0.832,  0.832,     NA,    NA,    
    -0.035, -1.404, -0.285,  0.541, 1.147,    
     0.840,     NA,     NA,     NA,    NA,     
    -0.140,     NA,     NA,     NA,    NA,
     0.126, -0.206, -0.257,  0.336,    NA,
     0.565,  0.865, -1.186, -1.199, 0.993,
     2.034,     NA,     NA,     NA,    NA,
     1.461, -0.279,  0.279,     NA,    NA),
  9, 5, byrow = TRUE), 2)

c <- round(c(0.249, NA, NA, 0.164, 0.137, NA, NA, 0.022, NA), 2)


###################################################
### code chunk number 5: plink-UD.Rnw:434-435
###################################################
list(a = a, b = b, c = c)


###################################################
### code chunk number 6: plink-UD.Rnw:442-443
###################################################
cat <- c(2, 3, 5, 2, 2, 4, 5, 2, 3)


###################################################
### code chunk number 7: plink-UD.Rnw:457-459
###################################################
pm <- as.poly.mod(9, c("drm", "grm", "nrm"),
  list(c(1, 4, 5, 8), c(2, 3, 9), 6:7))


###################################################
### code chunk number 8: plink-UD.Rnw:462-464
###################################################
pm <- as.poly.mod(9, c("grm", "drm", "nrm"), 
  list(c(2, 3, 9), c(1, 4, 5, 8), 6:7))


###################################################
### code chunk number 9: plink-UD.Rnw:490-491
###################################################
pars <- as.irt.pars(x, cat = cat, poly.mod = pm, location = TRUE)


###################################################
### code chunk number 10: plink-UD.Rnw:495-497
###################################################
common <- matrix(c(51:60, 1:10), 10, 2)
common


###################################################
### code chunk number 11: plink-UD.Rnw:502-505 (eval = FALSE)
###################################################
## pars <- as.irt.pars(x = list(x.D, x.E, x.F), 
##   common = list(common.DE, common.EF), cat = list(cat.D, cat.E, cat.F), 
##   poly.mod = list(poly.mod.D, poly.mod.E, poly.mod.F))


###################################################
### code chunk number 12: plink-UD.Rnw:510-511 (eval = FALSE)
###################################################
## pars <- combine.pars(x = list(pars.DE, pars.F), common = common.EF)


###################################################
### code chunk number 13: plink-UD.Rnw:576-580
###################################################
cat <- rep(2, 36)
pm <- as.poly.mod(36)
x <- as.irt.pars(KB04$pars, KB04$common, cat = list(cat, cat), 
  poly.mod = list(pm, pm), grp.names = c("new", "old"))


###################################################
### code chunk number 14: plink-UD.Rnw:583-585
###################################################
out <- plink(x)
summary(out)


###################################################
### code chunk number 15: plink-UD.Rnw:590-592
###################################################
out <- plink(x, rescale = "SL", base.grp = 2)
summary(out)


###################################################
### code chunk number 16: plink-UD.Rnw:597-598
###################################################
ability <- list(group1 = -4:4, group2 = -4:4)


###################################################
### code chunk number 17: plink-UD.Rnw:601-604
###################################################
out <- plink(x, rescale = "SL", ability = ability, base.grp = 2, 
  weights.t = as.weight(30, normal.wt = TRUE), symmetric = TRUE)
summary(out)


###################################################
### code chunk number 18: plink-UD.Rnw:607-608
###################################################
link.ability(out)


###################################################
### code chunk number 19: plink-UD.Rnw:614-617
###################################################
pm1 <- as.poly.mod(55, c("drm", "gpcm", "nrm"), dgn$items$group1)
pm2 <- as.poly.mod(55, c("drm", "gpcm", "nrm"), dgn$items$group2)
x <- as.irt.pars(dgn$pars, dgn$common, dgn$cat, list(pm1, pm2))


###################################################
### code chunk number 20: plink-UD.Rnw:620-622
###################################################
out <- plink(x) 
summary(out)


###################################################
### code chunk number 21: plink-UD.Rnw:625-627
###################################################
out1 <- plink(x, exclude = "nrm") 
summary(out1, descrip = TRUE)


###################################################
### code chunk number 22: plink-UD.Rnw:633-640
###################################################
pm1 <- as.poly.mod(41, c("drm", "gpcm"), reading$items[[1]])
pm2 <- as.poly.mod(70, c("drm", "gpcm"), reading$items[[2]])
pm3 <- as.poly.mod(70, c("drm", "gpcm"), reading$items[[3]])
pm4 <- as.poly.mod(70, c("drm", "gpcm"), reading$items[[4]])
pm5 <- as.poly.mod(72, c("drm", "gpcm"), reading$items[[5]])
pm6 <- as.poly.mod(71, c("drm", "gpcm"), reading$items[[6]])
pm <- list(pm1, pm2, pm3, pm4, pm5, pm6)


###################################################
### code chunk number 23: plink-UD.Rnw:659-663
###################################################
grp.names <- c("Grade 3.0", "Grade 4.0", "Grade 4.1", "Grade 5.1",
  "Grade 5.2", "Grade 6.2")
x <- as.irt.pars(reading$pars, reading$common, reading$cat, pm,
  grp.names = grp.names)


###################################################
### code chunk number 24: plink-UD.Rnw:666-668 (eval = FALSE)
###################################################
## out <- plink(x, method = c("HB", "SL"), base.grp = 4)
## summary(out)


###################################################
### code chunk number 25: plink-UD.Rnw:670-672
###################################################
out <- plink(x, method = c("HB", "SL"), base.grp = 4)
summary(out)


###################################################
### code chunk number 26: plink-UD.Rnw:699-705
###################################################
dichot <- matrix(c(1.2, -1.1, 0.19, 0.8, 2.1, 0.13), 2, 3, byrow = TRUE)
poly <- t(c(0.64, -1.8, -0.73, 0.45))
mixed.pars <- rbind(cbind(dichot, matrix(NA, 2, 1)), poly)
cat <- c(2, 2, 4)
pm <- as.poly.mod(3, c("drm", "gpcm"), list(1:2, 3))
mixed.pars <- as.irt.pars(mixed.pars, cat = cat, poly.mod = pm)


###################################################
### code chunk number 27: plink-UD.Rnw:707-709
###################################################
out <- mixed(mixed.pars, theta = -4:4) 
round(get.prob(out), 3)


###################################################
### code chunk number 28: plink-UD.Rnw:745-748
###################################################
pm <- as.poly.mod(36)
x <- as.irt.pars(KB04$pars, KB04$common, 
  cat = list(rep(2, 36), rep(2, 36)), poly.mod = list(pm, pm))


###################################################
### code chunk number 29: plink-UD.Rnw:750-752
###################################################
out <- plink(x, rescale = "MS", base.grp = 2, D = 1.7, 
  exclude = list(27, 27), grp.names = c("new", "old"))


###################################################
### code chunk number 30: plink-UD.Rnw:757-760
###################################################
wt <- as.weight(theta = c(-5.21, -4.16, -3.12, -2.07, -1.03, 0.02, 1.06,
  2.11, 3.15, 4.20), weight = c(0.0001, 0.0028, 0.0302, 0.1420, 0.3149,
  0.3158, 0.1542, 0.0359, 0.0039, 0.0002))


###################################################
### code chunk number 31: plink-UD.Rnw:763-765
###################################################
eq.out <- equate(out, method = c("TSE", "OSE"), weights1 = wt, 
  syn.weights = c(1, 0), D = 1.7)


###################################################
### code chunk number 32: plink-UD.Rnw:771-772
###################################################
eq.out$tse[1:10,]


###################################################
### code chunk number 33: plink-UD.Rnw:776-777
###################################################
eq.out$ose$scores[1:10,]


###################################################
### code chunk number 34: plink-UD.Rnw:813-818
###################################################
pdf.options(family = "Times")
trellis.device(device = "pdf", file = "IRC.pdf")
tmp <- plot(pars, incorrect = TRUE, auto.key = list(space = "right"))
print(tmp)
dev.off()


###################################################
### code chunk number 35: plink-UD.Rnw:820-821
###################################################
plot(pars, incorrect = TRUE, auto.key = list(space = "right"))


###################################################
### code chunk number 36: plink-UD.Rnw:835-860
###################################################
pm1 <- as.poly.mod(41, c("drm", "gpcm"), reading$items[[1]])
pm2 <- as.poly.mod(70, c("drm", "gpcm"), reading$items[[2]])
pm3 <- as.poly.mod(70, c("drm", "gpcm"), reading$items[[3]])
pm4 <- as.poly.mod(70, c("drm", "gpcm"), reading$items[[4]])
pm5 <- as.poly.mod(72, c("drm", "gpcm"), reading$items[[5]])
pm6 <- as.poly.mod(71, c("drm", "gpcm"), reading$items[[6]])
pm <- list(pm1, pm2, pm3, pm4, pm5, pm6)
grp.names <- c("Grade 3.0", "Grade 4.0", "Grade 4.1", "Grade 5.1", "Grade 5.2", "Grade 6.2")
x <- as.irt.pars(reading$pars, reading$common, reading$cat, pm)
out <- plink(x, method = "SL",rescale = "SL", base.grp = 4, grp.names = grp.names)

pdf.options(family="Times")
pdf("drift_a.pdf", 4, 4.2)
plot(out, drift = "a", sep.mod = TRUE, groups = 4, drift.sd = 2)
dev.off()

pdf.options(family="Times")
pdf("drift_b.pdf", 4, 4.2)
plot(out, drift = "b", sep.mod = TRUE, groups = 4, drift.sd = 2)
dev.off()

pdf.options(family="Times")
pdf("drift_c.pdf", 4, 4.2)
plot(out, drift = "c", sep.mod = TRUE, groups = 4, drift.sd = 2)
dev.off()


###################################################
### code chunk number 37: plink-UD.Rnw:863-864
###################################################
plot(out, drift = "pars", sep.mod = TRUE, groups = 4, drift.sd = 2)


