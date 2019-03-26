library(Renext)


### Name: interevt
### Title: Interevents (or interarrivals) from events dates
### Aliases: interevt

### ** Examples

## Use Brest data
ie <- interevt(date = Brest$OTdata$date, skip = Brest$OTmissing)

expplot(ie$interevt$duration, rate = 1 / mean(ie$interevt$duration),
  main = "No threshold")

## keep only data over a threshold
ind1 <- Brest$OTdata$Surge >= 35
ie1 <- interevt(Brest$OTdata$date[ind1], skip = Brest$OTmissing)
expplot(ie1$interevt$duration, main = "Threshold = 35")

## increase threshold
ind2 <- Brest$OTdata$Surge >= 55
ie2 <- interevt(date = Brest$OTdata$date[ind2], skip = Brest$OTmissing)
expplot(ie2$interevt$duration, main = "Threshold = 55 cm")



