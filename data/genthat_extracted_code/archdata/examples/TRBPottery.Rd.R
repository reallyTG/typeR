library(archdata)


### Name: TRBPottery
### Title: Neolithic TRB Pottery from Demark
### Aliases: TRBPottery
### Keywords: datasets

### ** Examples

data(TRBPottery)
TRBPottery.frm <- aggregate(TRBPottery[, -1], list(Form=TRBPottery$Form), mean)
Xvals <- TRBPottery.frm[, seq(2, 16, by=2)]
Yvals <- TRBPottery.frm[, seq(3, 17, by=2)]
matplot(t(Xvals), t(Yvals), xlab="X", ylab="Y", type="l", asp=1, las=1, col="black", lwd=2)
legend("topleft", levels(TRBPottery$Form), lty=1:3, col="black", lwd=2)



