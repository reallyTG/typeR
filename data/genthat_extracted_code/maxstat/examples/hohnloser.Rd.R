library(maxstat)


### Name: hohnloser
### Title: Left ventricular ejection fraction of patients with malignant
###   ventricular tachyarrhythmias.
### Aliases: hohnloser
### Keywords: datasets

### ** Examples


set.seed(29)

library("survival")

# limiting distribution

maxstat.test(Surv(month, cens) ~ EF, data=hohnloser, 
smethod="LogRank", pmethod="Lau92")

# with integer valued scores for comparison

maxstat.test(Surv(month, cens) ~ EF, data=hohnloser, 
smethod="LogRank", pmethod="Lau92", iscores=TRUE)

# improved Bonferroni inequality

maxstat.test(Surv(month, cens) ~ EF, data=hohnloser,
smethod="LogRank", pmethod="Lau94")

maxstat.test(Surv(month, cens) ~ EF, data=hohnloser,
smethod="LogRank", pmethod="Lau94", iscores=TRUE)


# small sample solution by Hothorn & Lausen

maxstat.test(Surv(month, cens) ~ EF, data=hohnloser,
smethod="LogRank", pmethod="HL")

# normal approximation

maxstat.test(Surv(month, cens) ~ EF, data=hohnloser,
smethod="LogRank", pmethod="exactGauss")

maxstat.test(Surv(month, cens) ~ EF, data=hohnloser,
smethod="LogRank", pmethod="exactGauss", iscores=TRUE)

# conditional Monte-Carlo
maxstat.test(Surv(month, cens) ~ EF, data=hohnloser,
smethod="LogRank", pmethod="condMC", B = 9999)




