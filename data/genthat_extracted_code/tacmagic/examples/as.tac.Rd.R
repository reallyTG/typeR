library(tacmagic)


### Name: as.tac
### Title: Creates a tac object from a data.frame
### Aliases: as.tac

### ** Examples

manual <- data.frame(start=c(0:4), end=c(2:6), 
                     ROI1=c(10.1:14.2), ROI2=c(11:15))
manual_tac <- as.tac(manual, time_unit="minutes", activity_unit="kBq/cc")



