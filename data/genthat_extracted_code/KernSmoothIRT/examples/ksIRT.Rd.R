library(KernSmoothIRT)


### Name: ksIRT
### Title: ksIRT - kernel smoothing in Item Response Theory
### Aliases: ksIRT print.ksIRT

### ** Examples

 ## Psych101 data
data(Psych101)
Psych1 <- ksIRT(responses = Psychresponses[1:100,], key = Psychkey, format = 1)
Psych1
    
plot(Psych1,plottype="OCC", item=c(24,25,92,96))
plot(Psych1,plottype="EIS", item=c(24,25,92,96))
plot(Psych1, plottype="tetrahedron", items=c(24,92))
plot(Psych1, plottype="triangle", items=c(24,92))
plot(Psych1, plottype="PCA")
plot(Psych1,plottype="RCC", subjects=c(33,92))
 
PCA(Psych1)
subjEIS(Psych1)
subjETS(Psych1)
subjOCC(Psych1, stype="ObsScore")
subjscore(Psych1)
subjthetaML(Psych1)
subjscoreML(Psych1)
 
plot(Psych1, plottype="expected")
plot(Psych1, plottype="sd")
plot(Psych1, plottype="density")

## HIV data
data(HIV)
HIVsubset <- HIV[c(c(1:50),c(1508:1558),c(2934:2984)),]
gr2 <- as.character(HIVsubset$SITE)
DIF2 <- ksIRT(res=HIVsubset[,-(1:3)], key=HIVkey, format = 2, groups=gr2, miss="omit")

plot(DIF2, plottype="expectedDIF", lwd=2)
plot(DIF2, plottype="densityDIF", lwd=2)
plot(DIF2, plottype="EISDIF",  item=c(6,11))

### Ordinal Survey Data
data(BDI)
BDI1 <- ksIRT(responses=BDIresponses, key=BDIkey, format = 2, miss="omit")

plot(BDI1, plottype="OCC", items=1:4)
plot(BDI1, plottype="sd")
plot(BDI1, plottype="density", ylim=c(0,0.1))




