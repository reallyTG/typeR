library(BradleyTerry2)


### Name: plotProportions
### Title: Plot Proportions of Tied Matches and Non-tied Matches Won
### Aliases: plotProportions
### Keywords: models nonlinear

### ** Examples


#### A Bradley-Terry example using icehockey data

## Fit the standard Bradley-Terry model, ignoring home advantage
standardBT <- BTm(outcome = result,
                  player1 = visitor, player2 = opponent,
                  id = "team", data = icehockey)

## comparing teams on a "level playing field"
levelBT <- BTm(result,
               data.frame(team = visitor, home.ice = 0),
               data.frame(team = opponent, home.ice = home.ice),
               ~ team + home.ice,
               id = "team", data = icehockey)

## compare fit to observed proportion won
## exclude tied matches as not explicitly modelled here
par(mfrow = c(1, 2))
plotProportions(win = result == 1, loss = result == 0,
                player1 = visitor, player2 = opponent,
                abilities = BTabilities(standardBT)[,1],
                data = icehockey, subset = result != 0.5,
                main = "Without home advantage")

plotProportions(win = result == 1, loss = result == 0,
                player1 = visitor, player2 = opponent,
                home.adv = coef(levelBT)["home.ice"],
                at.home1 = 0, at.home2 = home.ice,
                abilities = BTabilities(levelBT)[,1],
                data = icehockey, subset = result != 0.5,
                main = "With home advantage")

#### A generalized Davidson example using football data
if (require(gnm)) {

    ## subset to first and last season for illustration
    football <- subset(football, season %in% c("2008-9", "2012-13"))

    ## convert to trinomial counts
    football.tri <- expandCategorical(football, "result", idvar = "match")

    ## add variable to indicate whether team playing at home
    football.tri$at.home <- !logical(nrow(football.tri))

    ## fit Davidson model
    Dav <- gnm(count ~ GenDavidson(result == 1, result == 0, result == -1,
                                   home:season, away:season, home.adv = ~1,
                                   tie.max = ~1,
                                   at.home1 = at.home,
                                   at.home2 = !at.home) - 1,
               eliminate = match, family = poisson, data = football.tri)

    ## fit shifted & scaled Davidson model
    shifScalDav <- gnm(count ~
        GenDavidson(result == 1, result == 0, result == -1,
                    home:season, away:season, home.adv = ~1,
                    tie.max = ~1, tie.scale = ~1, tie.mode = ~1,
                    at.home1 = at.home,
                    at.home2 = !at.home) - 1,
        eliminate = match, family = poisson, data = football.tri)

    ## diagnostic plots
    main <- c("Davidson", "Shifted & Scaled Davidson")
    mod <- list(Dav, shifScalDav)
    names(mod) <- main
    alpha <- names(coef(Dav)[-(1:2)])

    ## use football.tri data so that at.home can be found,
    ## but restrict to actual match results
    par(mfrow = c(1,2))
    for (i in 1:2) {
        coef <- parameters(mod[[i]])
        plotProportions(result == 1, result == 0, result == -1,
                        home:season, away:season,
                        abilities = coef[alpha],
                        home.adv = coef["home.adv"],
                        tie.max = coef["tie.max"],
                        tie.scale = coef["tie.scale"],
                        tie.mode = coef["tie.mode"],
                        at.home1 = at.home,
                        at.home2 = !at.home,
                        main = main[i],
                        data = football.tri, subset = count == 1)
    }
}




