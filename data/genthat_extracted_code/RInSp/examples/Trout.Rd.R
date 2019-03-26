library(RInSp)


### Name: Trout
### Title: Example of continuous data from fish prey lengths of brown trout
### Aliases: Trout
### Keywords: dataset

### ** Examples

# Summary of total length of preys in stomach content
# by geographic region
data(Trout)
# Mean prey length by individual
# First change zeros to NA
troutTMP = Trout
troutTMP[ troutTMP == 0] = NA
individuals = by(troutTMP[, 3:7], troutTMP[, 2], rowMeans, na.rm=TRUE)
TroutN = subset(Trout, Type == "N", PL1:PL5)
TroutN = TroutN[TroutN > 0]
TroutS = subset(Trout, Type == "S", PL1:PL5)
TroutS = TroutN[TroutS > 0]
boxplot(c(TroutS, TroutN) ~ c(rep("N", length(TroutN)), rep("S", length(TroutS))))
rm(list=ls(all=TRUE))




