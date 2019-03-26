library(RcmdrMisc)


### Name: summarySandwich
### Title: Linear Model Summary with Sandwich Standard Errors
### Aliases: summarySandwich summarySandwich.lm
### Keywords: misc

### ** Examples

    mod <- lm(prestige ~ income + education + type, data=Prestige)
    summary(mod)
    summarySandwich(mod)



