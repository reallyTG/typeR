library(ordinal)


### Name: profile.clmm2
### Title: Confidence intervals and profile likelihoods for the standard
###   deviation for the random term in cumulative link mixed models
### Aliases: profile.clmm2 confint.clmm2 confint.profile.clmm2
###   profile.clmm2 plot.profile.clmm2
### Keywords: models

### ** Examples

options(contrasts = c("contr.treatment", "contr.poly"))

if(require(lme4)) { ## access cbpp data
    cbpp2 <- rbind(cbpp[,-(2:3)], cbpp[,-(2:3)])
    cbpp2 <- within(cbpp2, {
        incidence <- as.factor(rep(0:1, each=nrow(cbpp)))
        freq <- with(cbpp, c(incidence, size - incidence))
    })

    ## Fit with Laplace approximation:
    fm1 <- clmm2(incidence ~ period, random = herd, weights = freq,
                 data = cbpp2, Hess = 1)

    pr.fm1 <- profile(fm1)
    confint(pr.fm1)

    par(mfrow = c(2,2))
    plot(pr.fm1)
    plot(pr.fm1, Log=TRUE, relative = TRUE)
    plot(pr.fm1, Log=TRUE, relative = FALSE)
}




