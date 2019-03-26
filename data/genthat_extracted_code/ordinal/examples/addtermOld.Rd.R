library(ordinal)


### Name: addterm.clm2
### Title: Try all one-term additions to and deletions from a model
### Aliases: addterm.clm2 dropterm.clm2
### Keywords: internal

### ** Examples


options(contrasts = c("contr.treatment", "contr.poly"))

if(require(MASS)) { ## dropterm, addterm, housing
    mB1 <- clm2(SURENESS ~ PROD + GENDER + SOUPTYPE,
                scale = ~ COLD, data = soup, link = "probit",
                Hess = FALSE)
    dropterm(mB1, test = "Chi")       # or
    dropterm(mB1, which = "location", test = "Chi")
    dropterm(mB1, which = "scale", test = "Chi")
    addterm(mB1, scope = ~.^2, test = "Chi", which = "location")
    addterm(mB1, scope = ~ . + GENDER + SOUPTYPE,
            test = "Chi", which = "scale")
    addterm(mB1, scope = ~ . + AGEGROUP + SOUPFREQ,
            test = "Chi", which = "location")

    ## Fit model from polr example:
    fm1 <- clm2(Sat ~ Infl + Type + Cont, weights = Freq, data = housing)
    addterm(fm1, ~ Infl + Type + Cont, test= "Chisq", which = "scale")
    dropterm(fm1, test = "Chisq")
}




