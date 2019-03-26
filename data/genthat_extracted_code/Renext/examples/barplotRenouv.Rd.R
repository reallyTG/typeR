library(Renext)


### Name: barplotRenouv
### Title: Barplot for Renouv "Over Threshold" counts
### Aliases: barplotRenouv

### ** Examples

## na.block influence for Brest data
opar <- par(mfrow = c(2, 2))

bp1 <- barplotRenouv(data = Brest.years, threshold = 30,
         main = "missing periods ignored")
bp2 <- barplotRenouv(data = Brest.years, threshold = 30,
         na.block = 1992, main = "1992 missing")
bp3 <- barplotRenouv(data = Brest.years, threshold = 30,
         na.block = 1991:1993, main ="1991:1993 missing")
bp4 <- barplotRenouv(data = Brest.years, threshold = 30,
         na.block = Brest.years.missing, main = "all missing periods")

par(opar)

## threshold influence
opar <- par(mfrow = c(2,2))

thresh <- c(30, 35, 40, 50)

for (i in 1:length(thresh)) {
  bp  <- barplotRenouv(data = Brest.years, threshold = thresh[i],
                   na.block = Brest.years.missing,
                   main = paste("threshold =", thresh[i], "cm at Brest"))
}
par(opar)



