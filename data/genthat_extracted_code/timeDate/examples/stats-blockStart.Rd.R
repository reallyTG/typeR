library(timeDate)


### Name: blockStart
### Title: Equally sized 'timeDate' Blocks
### Aliases: blockStart blockEnd
### Keywords: chron

### ** Examples
  
## timeSequence
   # 360 Days Series:
   tS <- timeSequence(length.out = 360)
    
## blockStart | blockEnd -
   Start <- blockStart(tS, 30)
   End <- blockEnd(tS, 30)
   Start
   End
   End-Start



