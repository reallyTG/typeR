### R code from vignette source 'RadOnc.Rnw'

###################################################
### code chunk number 1: RadOnc.Rnw:53-54
###################################################
library(RadOnc)


###################################################
### code chunk number 2: RadOnc.Rnw:56-59
###################################################
data.path <- system.file("extdata", package="RadOnc")
initial.path <- getwd()
options(width=75)


###################################################
### code chunk number 3: RadOnc.Rnw:79-80
###################################################
news(package="RadOnc")


###################################################
### code chunk number 4: RadOnc.Rnw:92-96
###################################################
temp <- c(readLines(paste(data.path, 'Jane_Doe.dvh', sep='/'),n=50), "...", "...")
for (i in 1:52) {
cat(temp[i], "\n")
}


###################################################
### code chunk number 5: RadOnc.Rnw:99-100
###################################################
johndoe <- read.DVH(file=system.file("extdata/John_Doe.dvh", package="RadOnc"), type="aria10", verbose=TRUE)


###################################################
### code chunk number 6: RadOnc.Rnw:103-104 (eval = FALSE)
###################################################
## read.DVH(file="Jane_Doe.dvh", type="aria10", verbose=TRUE)


###################################################
### code chunk number 7: RadOnc.Rnw:106-107
###################################################
janedoe <- read.DVH(file=system.file("extdata/Jane_Doe.dvh", package="RadOnc"), type="aria10", verbose=TRUE)


###################################################
### code chunk number 8: RadOnc.Rnw:111-112 (eval = FALSE)
###################################################
## DVHs <- read.DVH(file=c("Jane_Doe.dvh", "John_Doe.dvh"), type="aria10")


###################################################
### code chunk number 9: RadOnc.Rnw:114-116
###################################################
DVHs <- read.DVH(file=system.file(paste("extdata", c("Jane_Doe.dvh", "John_Doe.dvh"), sep="/"), package="RadOnc"), type="aria10")
DVHs


###################################################
### code chunk number 10: fig1
###################################################
plot(as(janedoe.RTdata$structures,"DVH.list"),lwd=2.5)
plot(janedoe[c(3,6:7)],new=FALSE,col="red",lwd=1.25)


###################################################
### code chunk number 11: RadOnc.Rnw:140-142
###################################################
janedoe[1:4]
c(janedoe["PTV"], johndoe[c("CTV", "DUODENUM")])


###################################################
### code chunk number 12: RadOnc.Rnw:144-145
###################################################
temp <- janedoe


###################################################
### code chunk number 13: RadOnc.Rnw:147-150
###################################################
johndoe[["CTV"]]
janedoe[[1]] <- johndoe[["CTV"]]
janedoe[1:4]


###################################################
### code chunk number 14: RadOnc.Rnw:152-153
###################################################
janedoe <- temp


###################################################
### code chunk number 15: RadOnc.Rnw:157-160
###################################################
janedoe["KIDNEY$"]
janedoe[c(2,"IGHT.*")]
janedoe["(?i)liver"] ## (case insensitive matching) ##


###################################################
### code chunk number 16: RadOnc.Rnw:164-168
###################################################
subset(janedoe, structure=c("liver", "kidney"), ignore.case=TRUE)
subset(janedoe, constraint="volume > 200(cc)")
subset(janedoe, constraint="Dmean <= 500(cGy)")
subset(janedoe, constraint="D2cc < 20(Gy)")


###################################################
### code chunk number 17: RadOnc.Rnw:173-177
###################################################
names(janedoe)[1:4] <- c("A1", "B2", "C3", "D4")
names(rev(janedoe[1:4]))
length(johndoe)
lapply(johndoe, function(DVH) { DVH[c("DMIN", "D50%", "DMAX", "V20%")] })


###################################################
### code chunk number 18: RadOnc.Rnw:179-180
###################################################
janedoe <- temp


###################################################
### code chunk number 19: RadOnc.Rnw:184-186
###################################################
janedoe[1:2]$patients
janedoe[3:4]$ID


###################################################
### code chunk number 20: RadOnc.Rnw:195-199
###################################################
johndoe[["DUODENUM"]]["V20Gy"]
johndoe[["DUODENUM"]]["D2.5%"]
johndoe[["DUODENUM"]]["volume"] * 0.025
johndoe[["DUODENUM"]]["D2.3286cc"]


###################################################
### code chunk number 21: RadOnc.Rnw:202-204
###################################################
johndoe[["DUODENUM"]][c("V5%", "V20Gy", "D2.5%", "D2.3286cc", "Dmax")]
johndoe[1:4]$"V10-20Gy,V20Gy,Dmax"


###################################################
### code chunk number 22: RadOnc.Rnw:207-208
###################################################
johndoe[["DUODENUM"]][c("V5", "VGy", "volume", 2.5, "", "Dmax%")]


###################################################
### code chunk number 23: RadOnc.Rnw:211-212
###################################################
johndoe[["LIVER"]][c("V10Gy(%)","D25%","D25%(Gy)")]


###################################################
### code chunk number 24: RadOnc.Rnw:215-217
###################################################
johndoe[["LIVER"]][c("Dintegral","Dintegral(>0cGy)")]
johndoe[["LIVER"]][c("Dintegral(<20Gy)","Dintegral(10-20Gy)")]


###################################################
### code chunk number 25: RadOnc.Rnw:225-229
###################################################
gEUD(janedoe[1:3], 6:8)
gEUD(janedoe[1:3], 1) == unlist(janedoe[1:3]$"Dmean")
gEUD(janedoe[1:3], Inf) == unlist(janedoe[1:3]$"Dmax")
gEUD(janedoe[1:3], -Inf) == unlist(janedoe[1:3]$"Dmin")


###################################################
### code chunk number 26: RadOnc.Rnw:236-238
###################################################
LQE(c(4500, 5500, 6000), aB=3, fractions=c(300, 200))
LQE(c(4500, 5500, 6000), aB=3, N=c(20, 36))


###################################################
### code chunk number 27: fig2
###################################################
plot(janedoe[[3]], volume="relative", dose="absolute", type="cumulative")


###################################################
### code chunk number 28: fig3
###################################################
plot(janedoe[1:3], plot.type="i", col=c("red", "green", "blue"), 
legend="topright", legend.labels=names(janedoe[1:3]))


###################################################
### code chunk number 29: fig4
###################################################
plot(c(johndoe["STOMACH"],janedoe["STOMACH"]), #group 1
c(janedoe["LIVER"],johndoe["LIVER"]), #group 2
c(johndoe["DUODENUM"],janedoe["DUODENUM"]), #group 3
plot.type="g", dose="relative", col=c("blue", "red", "green"), 
lwd=2, lty="dashed", fill.lty="solid", fill.transparency=0.3)


###################################################
### code chunk number 30: fig5
###################################################
group1 <- c("CTV", "PTV")
group2 <- c("LIVER", "STOMACH", "SMALL_BOWEL")
plot(c(johndoe[group1],janedoe[group1]), 
c(janedoe[group2],johndoe[group2]),
plot.type="t", main="Target v. OAR t-Test", alpha=0.001, 
col=c("red", "blue"), lty="dashed", fill.lty="solid")


###################################################
### code chunk number 31: fig6
###################################################
plot(janedoe[2:9], plot.type="b", volume="abs", dose="rel")


###################################################
### code chunk number 32: RadOnc.Rnw:313-314 (eval = FALSE)
###################################################
## plot(stomach, col="lightblue")


###################################################
### code chunk number 33: fig7
###################################################
par(mar=c(2,2,2,2))
persp(stomach$doses,as.numeric(colnames(stomach$volumes)),stomach$volumes,border=NA,col="lightblue",shade=0.65,xlab="Dose (Gy)",zlab="Volume (cc)",ylab="z (mm)",ticktype="detailed",phi=30, theta=30)


###################################################
### code chunk number 34: fig8
###################################################
plot(janedoe)
plot(median(janedoe), new=FALSE, col="red", lwd=2)
plot(mean(janedoe), new=FALSE, col="blue", lwd=2, lty="dashed")


###################################################
### code chunk number 35: RadOnc.Rnw:344-347
###################################################
L.kidney <- janedoe[["LEFT_KIDNEY"]]
R.kidney <- janedoe[["RIGHT_KIDNEY"]]
total.kidney <- sum(janedoe[c("LEFT_KIDNEY", "RIGHT_KIDNEY")])


###################################################
### code chunk number 36: RadOnc.Rnw:349-355 (eval = FALSE)
###################################################
## L.kidney <- janedoe[["LEFT_KIDNEY"]]
## R.kidney <- janedoe[["RIGHT_KIDNEY"]]
## total.kidney <- sum(janedoe[c("LEFT_KIDNEY", "RIGHT_KIDNEY")])
## plot(total.kidney, type="diff", volume="abs")
## plot(L.kidney, new=FALSE, type="diff", volume="abs", col="red")
## plot(R.kidney, new=FALSE, type="diff", volume="abs", col="blue")


###################################################
### code chunk number 37: fig9
###################################################
plot(total.kidney, type="diff", volume="abs")
plot(L.kidney, new=FALSE, type="diff", volume="abs", col="red")
plot(R.kidney, new=FALSE, type="diff", volume="abs", col="blue")


###################################################
### code chunk number 38: RadOnc.Rnw:371-374
###################################################
groupA <- janedoe[c("LIVER","LEFT_KIDNEY","RIGHT_KIDNEY","CORD")]
groupB <- janedoe[c("CTV", "PTV")]
t.test(unlist(groupA$"V20Gy"), unlist(groupB$"V20Gy"))


###################################################
### code chunk number 39: RadOnc.Rnw:379-381 (eval = FALSE)
###################################################
## AvB <- t.test(groupA, groupB)
## plot(AvB$dose, AvB$p, type="l", log="y", xlab="Dose (cGy)", ylab="p-value")


###################################################
### code chunk number 40: fig10
###################################################
AvB <- t.test(groupA, groupB)
plot(AvB$dose, AvB$p, type="l", log="y", xlab="Dose (cGy)", ylab="p-value")
abline(v=2000,col="gray", lty="dashed")
points(2000,approx(AvB$dose, AvB$p, 2000)$y, col="red")
text(2000,approx(AvB$dose, AvB$p, 2000)$y, col="red", labels="V20Gy (p=5.347e-05)",pos=4)


###################################################
### code chunk number 41: RadOnc.Rnw:406-407 (eval = FALSE)
###################################################
## data <- read.DICOM.RT(path="<<DICOM directory>>", verbose=TRUE)


###################################################
### code chunk number 42: RadOnc.Rnw:411-412
###################################################
data("RadOnc")


###################################################
### code chunk number 43: RadOnc.Rnw:419-421
###################################################
teeth[1:2]
c(cord, mandible)


###################################################
### code chunk number 44: RadOnc.Rnw:423-424
###################################################
temp <- teeth


###################################################
### code chunk number 45: RadOnc.Rnw:426-429
###################################################
teeth[[1]]
teeth[[1]] <- teeth[["Tooth #3"]]
teeth


###################################################
### code chunk number 46: RadOnc.Rnw:431-432
###################################################
teeth <- temp


###################################################
### code chunk number 47: RadOnc.Rnw:436-437
###################################################
teeth["Tooth.*"]


###################################################
### code chunk number 48: RadOnc.Rnw:442-446
###################################################
names(teeth) <- c("Larry", "Curly", "Moe")
names(rev(teeth[1:3]))
length(teeth)
lapply(teeth, function(tooth) { range(tooth) })


###################################################
### code chunk number 49: RadOnc.Rnw:448-449
###################################################
teeth <- temp


###################################################
### code chunk number 50: fig11 (eval = FALSE)
###################################################
## plot(mandible)


###################################################
### code chunk number 51: fig12 (eval = FALSE)
###################################################
## plot(cord)


###################################################
### code chunk number 52: RadOnc.Rnw:487-488 (eval = FALSE)
###################################################
## compareStructures(teeth, method="axial", plot=TRUE)


###################################################
### code chunk number 53: fig13
###################################################
compareStructures(teeth, method="axial", plot=TRUE, pixels=40)


###################################################
### code chunk number 54: RadOnc.Rnw:500-501
###################################################
teeth <- teeth[c(1,3)]


###################################################
### code chunk number 55: RadOnc.Rnw:503-504
###################################################
compareStructures(teeth, method="hausdorff", hausdorff.method="mean")


###################################################
### code chunk number 56: RadOnc.Rnw:506-507
###################################################
teeth <- temp


###################################################
### code chunk number 57: RadOnc.Rnw:511-512
###################################################
compareStructures(teeth, method="DSC")


###################################################
### code chunk number 58: RadOnc.Rnw:545-546
###################################################
news(package="RadOnc")


