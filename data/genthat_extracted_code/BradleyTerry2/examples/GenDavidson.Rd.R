library(BradleyTerry2)


### Name: GenDavidson
### Title: Specify a Generalised Davidson Term in a gnm Model Formula
### Aliases: GenDavidson
### Keywords: models nonlinear

### ** Examples


### example requires gnm
if (require(gnm)) {
    ### convert to trinomial counts
    football.tri <- expandCategorical(football, "result", idvar = "match")
    head(football.tri)

    ### add variable to indicate whether team playing at home
    football.tri$at.home <- !logical(nrow(football.tri))

    ### fit shifted & scaled Davidson model
    ###  - subset to first and last season for illustration
    shifScalDav <- gnm(count ~
        GenDavidson(result == 1, result == 0, result == -1,
                    home:season, away:season, home.adv = ~1,
                    tie.max = ~1, tie.scale = ~1, tie.mode = ~1,
                    at.home1 = at.home,
                    at.home2 = !at.home) - 1,
        eliminate = match, family = poisson, data = football.tri,
        subset = season %in% c("2008-9", "2012-13"))

    ### look at coefs
    coef <- coef(shifScalDav)
    ## home advantage
    exp(coef["home.adv"])
    ## max p(tie)
    plogis(coef["tie.max"])
    ## mode p(tie)
    plogis(coef["tie.mode"])
    ## scale relative to Davidson of dependence of p(tie) on p(win|not a draw)
    exp(coef["tie.scale"])

    ### check model fit
    alpha <- names(coef[-(1:4)])
    plotProportions(result == 1, result == 0, result == -1,
                    home:season, away:season,
                    abilities = coef[alpha], home.adv = coef["home.adv"],
                    tie.max = coef["tie.max"], tie.scale = coef["tie.scale"],
                    tie.mode = coef["tie.mode"],
                    at.home1 = at.home, at.home2 = !at.home,
                    data = football.tri, subset = count == 1)
}

### analyse all five seasons
### - takes a little while to run, particularly likelihood ratio tests
## Not run: 
##D ### fit Davidson model
##D Dav <- gnm(count ~ GenDavidson(result == 1, result == 0, result == -1,
##D                                home:season, away:season, home.adv = ~1,
##D                                tie.max = ~1,
##D                                at.home1 = at.home,
##D                                at.home2 = !at.home) - 1,
##D            eliminate = match, family = poisson, data = football.tri)
##D 
##D ### fit scaled Davidson model
##D scalDav <- gnm(count ~ GenDavidson(result == 1, result == 0, result == -1,
##D                                   home:season, away:season, home.adv = ~1,
##D                                   tie.max = ~1, tie.scale = ~1,
##D                                   at.home1 = at.home,
##D                                   at.home2 = !at.home) - 1,
##D                eliminate = match, family = poisson, data = football.tri)
##D 
##D ### fit shifted & scaled Davidson model
##D shifScalDav <- gnm(count ~
##D     GenDavidson(result == 1, result == 0, result == -1,
##D                 home:season, away:season, home.adv = ~1,
##D                 tie.max = ~1, tie.scale = ~1, tie.mode = ~1,
##D                 at.home1 = at.home,
##D                 at.home2 = !at.home) - 1,
##D     eliminate = match, family = poisson, data = football.tri)
##D 
##D ### compare models
##D anova(Dav, scalDav, shifScalDav, test = "Chisq")
##D 
##D ### diagnostic plots
##D main <- c("Davidson", "Scaled Davidson", "Shifted & Scaled Davidson")
##D mod <- list(Dav, scalDav, shifScalDav)
##D names(mod) <- main
##D 
##D ## use football.tri data so that at.home can be found,
##D ## but restrict to actual match results
##D par(mfrow = c(2,2))
##D for (i in 1:3) {
##D     coef <- parameters(mod[[i]])
##D     plotProportions(result == 1, result == 0, result == -1,
##D                     home:season, away:season,
##D                     abilities = coef[alpha],
##D                     home.adv = coef["home.adv"],
##D                     tie.max = coef["tie.max"],
##D                     tie.scale = coef["tie.scale"],
##D                     tie.mode = coef["tie.mode"],
##D                     at.home1 = at.home,
##D                     at.home2 = !at.home,
##D                     main = main[i],
##D                     data = football.tri, subset = count == 1)
##D }
## End(Not run)




