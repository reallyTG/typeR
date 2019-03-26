library(MCPAN)


### Name: summary.Shannonci
### Title: Summary for Shannonci
### Aliases: summary.Shannonci
### Keywords: print

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

ShannonS<-Shannonci(X=HCDcounts, f=HCDf, type = "Sequen",
 alternative = "greater", conf.level = 0.9, dist = "N")

summary(ShannonS)




