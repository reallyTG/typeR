library(TTR)


### Name: MFI
### Title: Money Flow Index
### Aliases: MFI moneyFlow
### Keywords: ts

### ** Examples


data(ttrc)
mfi <- MFI(ttrc[,c("High","Low","Close")], ttrc[,"Volume"])




