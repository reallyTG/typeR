library(HelpersMG)


### Name: LD50
### Title: Estimate the parameters that best describe LD50
### Aliases: LD50

### ** Examples

## Not run: 
##D library("HelpersMG")
##D data <- data.frame(Doses=c(80, 120, 150, 150, 180, 200),
##D Alive=c(10, 12, 8, 6, 2, 1),
##D Dead=c(0, 1, 5, 6, 9, 15))
##D LD50_logistic <- LD50(data, equation="logistic")
##D predict(LD50_logistic, doses=c(140, 170))
##D plot(LD50_logistic)
##D LD50_probit <- LD50(data, equation="probit")
##D predict(LD50_probit, doses=c(140, 170))
##D plot(LD50_probit)
##D LD50_logit <- LD50(data, equation="logit")
##D predict(LD50_logit, doses=c(140, 170))
##D plot(LD50_logit)
##D LD50_hill <- LD50(data, equation="hill")
##D predict(LD50_hill, doses=c(140, 170))
##D plot(LD50_hill)
##D LD50_Richards <- LD50(data, equation="Richards")
##D predict(LD50_Richards, doses=c(140, 170))
##D plot(LD50_Richards)
##D LD50_Hulin <- LD50(data, equation="Hulin")
##D predict(LD50_Hulin, doses=c(140, 170))
##D plot(LD50_Hulin)
##D LD50_DoubleRichards <- LD50(data, equation="Double-Richards")
##D predict(LD50_DoubleRichards, doses=c(140, 170))
##D plot(LD50_DoubleRichards)
## End(Not run)



