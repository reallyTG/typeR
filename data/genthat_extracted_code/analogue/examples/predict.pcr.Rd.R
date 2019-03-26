library(analogue)


### Name: predict.pcr
### Title: Predicted values from a principal components regression
### Aliases: predict.pcr
### Keywords: methods

### ** Examples

## Load the Imbrie & Kipp data and
## summer sea-surface temperatures
data(ImbrieKipp)
data(SumSST)

## choose 10 samples to act as a test set, for illustration
take <- c(5,58,31,51,42,28,30,57,8,50)

## normal interface and apply Hellinger transformation
mod <- pcr(ImbrieKipp[-take, ], SumSST[-take], tranFun = Hellinger)

## predictions
predict(mod, ImbrieKipp[take, ], ncomp = 4)

## predictions
set.seed(123)
predict(mod, ImbrieKipp[take, ], ncomp = 4, CV = "bootstrap",
        nboot = 100)




