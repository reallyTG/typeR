library(mpt)


### Name: recogROC
### Title: Recognition Receiver Operating Characteristics
### Aliases: recogROC
### Keywords: datasets

### ** Examples

## Data from Broeder & Schuetz (2009, Table 1, Exp. 1)
data(recogROC)

## Fit the two-high-threshold model with restrictions
mpt1 <- mpt(mptspec("2HT", .replicates=5,
                    .restr=list(r1=r, r2=r, r3=r, r4=r, r5=r,
                                d1=d, d2=d, d3=d, d4=d, d5=d)), recogROC)
summary(mpt1)  # Table 2

## Hit rate and false alarm rate
hrfa <- data.frame(
   obshr = (recogROC$freq/mpt1$n)[seq(1, 17, 4)],
   obsfa = (recogROC$freq/mpt1$n)[seq(3, 19, 4)],
  predhr = mpt1$pcat[seq(1, 17, 4)],
  predfa = mpt1$pcat[seq(3, 19, 4)]
)

## Plot ROC, Figure 5
plot(obshr ~ obsfa, hrfa, xlim=c(0, 1), ylim=c(0, 1), pch=16,
     main="Broeder and Schuetz (2009)",
     ylab="Hit rate", xlab="False alarm rate")
abline(0, 1)
lines(predhr ~ predfa, hrfa, type="l", lty=2)



