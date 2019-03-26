library(ordinal)


### Name: predict.clm2
### Title: Predict Method for CLM fits
### Aliases: predict.clm2 predict.clmm2
### Keywords: internal

### ** Examples

options(contrasts = c("contr.treatment", "contr.poly"))

## More manageable data set for less voluminous printing:
(tab26 <- with(soup, table("Product" = PROD, "Response" = SURENESS)))
dimnames(tab26)[[2]] <- c("Sure", "Not Sure", "Guess", "Guess", "Not Sure", "Sure")
dat26 <- expand.grid(sureness = as.factor(1:6), prod = c("Ref", "Test"))
dat26$wghts <- c(t(tab26))
dat26

m1 <- clm2(sureness ~ prod, scale = ~prod, data = dat26,
          weights = wghts, link = "logistic")
predict(m1)

mN1 <-  clm2(sureness ~ 1, nominal = ~prod, data = dat26,
            weights = wghts)
predict(mN1)

predict(update(m1, scale = ~.-prod))


#################################
## Mimicing the behavior of predict.polr:
if(require(MASS)) {
    ## Fit model from polr example:
    fm1 <- clm2(Sat ~ Infl + Type + Cont, weights = Freq, data = housing)
    predict(fm1)

    set.seed(123)
    nlev <- 3
    y <- gl(nlev, 5)
    x <- as.numeric(y) + rnorm(15)
    fm.clm <- clm2(y ~ x)
    fm.polr <- polr(y ~ x)

    ## The equivalent of predict.polr(object, type = "probs"):
    (pmat.polr <- predict(fm.polr, type = "probs"))
    ndat <- expand.grid(y = gl(nlev,1), x = x)
    (pmat.clm <- matrix(predict(fm.clm, newdata = ndat), ncol=nlev,
                        byrow = TRUE))
    all.equal(c(pmat.clm), c(pmat.polr), tol = 1e-5) # TRUE

    ## The equivalent of predict.polr(object, type = "class"):
    (class.polr <- predict(fm.polr))
    (class.clm <- factor(apply(pmat.clm, 1, which.max)))
    all.equal(class.clm, class.polr) ## TRUE
}




