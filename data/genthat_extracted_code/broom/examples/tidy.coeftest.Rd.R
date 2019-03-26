library(broom)


### Name: tidy.coeftest
### Title: Tidy a(n) coeftest object
### Aliases: tidy.coeftest lmtest_tidiers coeftest_tidiers

### ** Examples


if (require("lmtest", quietly = TRUE)) {
    data(Mandible)
    fm <- lm(length ~ age, data=Mandible, subset=(age <= 28))

    lmtest::coeftest(fm)
    tidy(coeftest(fm))
}




