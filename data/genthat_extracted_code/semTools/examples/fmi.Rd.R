library(semTools)


### Name: fmi
### Title: Fraction of Missing Information.
### Aliases: fmi

### ** Examples


HSMiss <- HolzingerSwineford1939[ , c(paste("x", 1:9, sep = ""),
                                      "ageyr","agemo","school")]
set.seed(12345)
HSMiss$x5 <- ifelse(HSMiss$x5 <= quantile(HSMiss$x5, .3), NA, HSMiss$x5)
age <- HSMiss$ageyr + HSMiss$agemo/12
HSMiss$x9 <- ifelse(age <= quantile(age, .3), NA, HSMiss$x9)

## calculate FMI (using FIML, provide partially observed data set)
(out1 <- fmi(HSMiss, exclude = "school"))
(out2 <- fmi(HSMiss, exclude = "school", method = "null"))
(out3 <- fmi(HSMiss, varnames = c("x5","x6","x7","x8","x9")))
(out4 <- fmi(HSMiss, group = "school"))

## Not run: 
##D ## ordered-categorical data
##D data(datCat)
##D lapply(datCat, class)
##D ## impose missing values
##D set.seed(123)
##D for (i in 1:8) datCat[sample(1:nrow(datCat), size = .1*nrow(datCat)), i] <- NA
##D ## impute data m = 3 times
##D library(Amelia)
##D set.seed(456)
##D impout <- amelia(datCat, m = 3, noms = "g", ords = paste0("u", 1:8), p2s = FALSE)
##D imps <- impout$imputations
##D ## calculate FMI, using list of imputed data sets
##D fmi(imps, group = "g")
## End(Not run)




