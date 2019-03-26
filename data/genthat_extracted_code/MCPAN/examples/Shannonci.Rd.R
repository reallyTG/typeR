library(MCPAN)


### Name: Shannonci
### Title: Confidence intervals for multiple contrasts of Shannon indices
### Aliases: Shannonci
### Keywords: htest

### ** Examples



data(HCD)

HCDcounts<-HCD[,-1]
HCDf<-HCD[,1]

# Comparison to the confidence bounds shown in
# Fritsch and Hsu (1999), Table 5, "Standard normal".

cmat<-rbind(
"HM-HU"=c(0,1,-1),
"HL-HM"=c(1,-1,0),
"HL-HU"=c(1,0,-1)
)

Shannonci(X=HCDcounts, f=HCDf, cmat=cmat,
 alternative = "two.sided", conf.level = 0.9, dist = "N")

# Note, that the calculated confidence intervals
# differ from those published by Fritsch and Hsu (1999),
# whenever Lower is involved.



# Comparison to the lower cretaceous,
# unadjusted confidence intervals:

Shannonci(X=HCDcounts, f=HCDf, type = "Dunnett",
 alternative = "greater", conf.level = 0.9, dist = "N")

# Stepwise comparison between the strata,
# unadjusted confidence intervals:

ShannonS<-Shannonci(X=HCDcounts, f=HCDf, type = "Sequen",
 alternative = "greater", conf.level = 0.9, dist = "N")


ShannonS

summary(ShannonS)

plot(ShannonS)


# A trend test based on multiple contrasts:

cmatTREND<-rbind(
"U-LM"=c(-0.5,-0.5,1),
"MU-L"=c(-1,0.5,0.5),
"U-L"=c(-1,0,1)
)

TrendCI<-Shannonci(X=HCDcounts, f=HCDf, cmat=cmatTREND,
 alternative = "greater", conf.level = 0.95, dist = "MVN")
TrendCI

plot(TrendCI)



  


