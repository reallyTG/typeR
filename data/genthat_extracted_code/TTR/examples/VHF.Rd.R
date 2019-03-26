library(TTR)


### Name: VHF
### Title: Vertical Horizontal Filter
### Aliases: VHF
### Keywords: ts

### ** Examples


data(ttrc)
vhf.close <- VHF(ttrc[,"Close"])
vhf.hilow <- VHF(ttrc[,c("High","Low","Close")])




