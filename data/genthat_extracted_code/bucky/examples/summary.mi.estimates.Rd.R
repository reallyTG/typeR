library(bucky)


### Name: summary.mi.estimates
### Title: Summary for multiple imputation
### Aliases: summary.mi.estimates
### Keywords: model htest

### ** Examples

if (require("Amelia")) {
    data(africa)
    a.out <- amelia(x = africa, cs = "country", ts = "year", logs = "gdp_pc")

    model <- mi.eval(lm(civlib ~ log(gdp_pc), data=a.out, subset=year==1973))

    summary(model)
}



