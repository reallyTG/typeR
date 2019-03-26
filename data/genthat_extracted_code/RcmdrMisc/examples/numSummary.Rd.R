library(RcmdrMisc)


### Name: numSummary
### Title: Summary Statistics for Numeric Variables
### Aliases: numSummary print.numSummary
### Keywords: misc

### ** Examples

if (require("car")){
    data(Prestige)
    Prestige[1, "income"] <- NA
    print(numSummary(Prestige[,c("income", "education")], 
    	statistics=c("mean", "sd", "quantiles", "cv", "skewness", "kurtosis")))
    print(numSummary(Prestige[,c("income", "education")], groups=Prestige$type))
    remove(Prestige)
}



