library(EMSC)


### Name: predict.EMSC
### Title: Predict Method for EMSC
### Aliases: predict.EMSC

### ** Examples

data(fishoil)
Raman.cal <- fishoil$Raman[  1:90,  850:3300]
Raman.val <- fishoil$Raman[-(1:90), 850:3300]
EMSC.cal  <- EMSC(Raman.cal)
EMSC.val  <- predict(EMSC.cal, Raman.val)
identical(EMSC.cal$model, EMSC.val$model) # Same model, reference spectrum, etc.

matplot(t(EMSC.cal$corrected), type = 'l', col = 'black', lty = 1, ylab = 'Intensity')
matplot(t(EMSC.val$corrected), type = 'l', col = 'red', lty = 2, add = TRUE)
legend('topleft', legend = c('Calibration','Validation'), lty = 1:2, col = 1:2)




