library(scuba)


### Name: ndl
### Title: No-Decompression Limit
### Aliases: ndl
### Keywords: utilities

### ** Examples

  # NDL for a dive to 15 metres
  ndl(15)

  # NDL for a dive to 24 metres on EANx 32
  ndl(15, g=nitrox(0.32))

  # NDL for a dive to 60 metres on Trimix 15/50 under ZH-L16A model
  ndl(70, g=trimix(0.15, 0.5), model="Z")

  # NDL for a repetitive dive on air to 15 metres, following an 
  # 18-minute air dive to 30 metres and half-hour surface interval
  firstdive <- dive(c(30,18), c(5,3), c(0,30))
  ndl(15, prevstate=haldane(firstdive))



