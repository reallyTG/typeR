library(Hmisc)


### Name: event.convert
### Title: Event Conversion for Time-to-Event Data
### Aliases: event.convert
### Keywords: hplot survival

### ** Examples

# To convert coded time-to-event data, then, draw an event chart:
surv.time <- c(5,6,3,1,2)
cens.ind   <- c(1,0,1,1,0)
surv.data  <- cbind(surv.time,cens.ind)
event.data <- event.convert(surv.data)
event.chart(cbind(rep(0,5),event.data),x.julian=TRUE,x.reference=1)



