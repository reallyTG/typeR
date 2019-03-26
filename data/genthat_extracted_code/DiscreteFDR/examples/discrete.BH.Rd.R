library(DiscreteFDR)


### Name: discrete.BH
### Title: [HSU], [HSD], [AHSU] and [AHSD] procedures
### Aliases: discrete.BH DBH ADBH

### ** Examples

X1 <- c(4, 2, 2, 14, 6, 9, 4, 0, 1)
X2 <- c(0, 0, 1, 3, 2, 1, 2, 2, 2)
N1 <- rep(148, 9)
N2 <- rep(132, 9)
Y1 <- N1-X1
Y2 <- N2-X2
df <- data.frame(X1,Y1,X2,Y2)
df
#Construction of the p-values and their support
df.formatted <- fisher.pvalues.support(counts = df, input = "noassoc")
raw.pvalues <- df.formatted$raw
pCDFlist <- df.formatted$support

DBH.su.fast <- DBH(raw.pvalues, pCDFlist)
DBH.sd.fast <- DBH(raw.pvalues, pCDFlist, direction = "sd")
DBH.sd.fast$Adjusted
DBH.su.crit <- DBH(raw.pvalues, pCDFlist, ret.crit.consts = TRUE)
DBH.sd.crit <- DBH(raw.pvalues, pCDFlist, direction = "sd", ret.crit.consts = TRUE)
DBH.sd.crit$Adjusted

ADBH.su.fast <- ADBH(raw.pvalues, pCDFlist)
ADBH.sd.fast <- ADBH(raw.pvalues, pCDFlist, direction = "sd")
ADBH.sd.fast$Adjusted
ADBH.su.crit <- ADBH(raw.pvalues, pCDFlist, ret.crit.consts = TRUE)
ADBH.sd.crit <- ADBH(raw.pvalues, pCDFlist, direction = "sd", ret.crit.consts = TRUE)
ADBH.sd.crit$Adjusted




