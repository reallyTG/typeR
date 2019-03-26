library(bucky)


### Name: mi.eval
### Title: Multiple-imputation evaluation
### Aliases: mi.eval
### Keywords: models htest

### ** Examples

if (require("Amelia")) {
    ## Load data
    data(africa)
    africa$civlib <- factor(round(africa$civlib*6), ordered=TRUE)

    ## Estimate a linear model using imputed data sets
    model0 <- lm(trade ~ log(gdp_pc), data=africa, subset=year==1973)
    summary(model0)

    ## Impute using Amelia    
    a.out <- amelia(x = africa, cs = "country", ts = "year",
                    logs = "gdp_pc", ord="civlib")

    ## Estimate a linear model using imputed data sets
    model1 <- mi.eval(lm(trade ~ log(gdp_pc), data=a.out, subset=year==1973))

    ## Show estimates
    model1
    coef(model1)

    ## Show summary information
    summary(model1)

    if (require("MASS")) {
        ## Estimate an ordered logit model
        model2 <- mi.eval(polr(civlib ~ log(gdp_pc) + log(population),
                               data=a.out))
        summary(model2)

        ## Also show thresholds by including thresholds with coefficients
        model3 <- mi.eval(polr(civlib ~ log(gdp_pc) + log(population),
                               data=a.out),
                          coef=function(x) c(x$coefficients, x$zeta))
        summary(model2)
    }
}



