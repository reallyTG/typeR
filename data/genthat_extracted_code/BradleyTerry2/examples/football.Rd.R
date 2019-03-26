library(BradleyTerry2)


### Name: football
### Title: English Premier League Football Results 2008/9 to 2012/13
### Aliases: football
### Keywords: datasets

### ** Examples


### example requires gnm
if (require(gnm)) {
    ### convert to trinomial counts
    football.tri <- expandCategorical(football, "result", idvar = "match")
    head(football.tri)

    ### add variable to indicate whether team playing at home
    football.tri$at.home <- !logical(nrow(football.tri))

    ### fit Davidson model for ties
    ###  - subset to first and last season for illustration
    Davidson <- gnm(count ~
        GenDavidson(result == 1, result == 0, result == -1,
                    home:season, away:season,
                    home.adv = ~1, tie.max = ~1,
                    at.home1 = at.home, at.home2 = !at.home) - 1,
        eliminate = match, family = poisson, data = football.tri,
        subset = season %in% c("2008-9", "2012-13"))

    ### see ?GenDavidson for further analysis
}




