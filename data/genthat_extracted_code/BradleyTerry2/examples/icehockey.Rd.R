library(BradleyTerry2)


### Name: icehockey
### Title: College Hockey Men's Division I 2009-10 results
### Aliases: icehockey
### Keywords: datasets

### ** Examples


### Fit the standard Bradley-Terry model
standardBT <- BTm(outcome = result,
    player1 = visitor, player2 = opponent,
    id = "team", data = icehockey)

## Bradley-Terry abilities
abilities <- exp(BTabilities(standardBT)[,1])

## Compute round-robin winning probability and KRACH ratings
## (scaled abilities such that KRACH = 100 for a team with
## round-robin winning probability of 0.5)
rankings <- function(abilities){
    probwin <- abilities/outer(abilities, abilities, "+")
    diag(probwin) <- 0
    nteams <- ncol(probwin)
    RRWP <- rowSums(probwin)/(nteams - 1)
    low <- quantile(abilities, 0.45)
    high <- quantile(abilities, 0.55)
    middling <- uniroot(function(x) {sum(x/(x+abilities)) - 0.5*nteams},
                        lower = low, upper = high)$root
    KRACH <- abilities/middling*100
    cbind(KRACH, RRWP) 
}

ranks <- rankings(abilities)
## matches those produced by Joe Schlobotnik's Build Your Own Rankings 
head(signif(ranks, 4)[order(ranks[,1], decreasing = TRUE),])

## At one point the NCAA rankings gave more credit for wins on
## neutral/opponent's ground. Home ice effects are easily
## incorporated into the Bradley-Terry model, comparing teams
## on a "level playing field"
levelBT <- BTm(result,
               data.frame(team = visitor, home.ice = 0),
               data.frame(team = opponent, home.ice = home.ice),
               ~ team + home.ice,
               id = "team", data = icehockey)

abilities <- exp(BTabilities(levelBT)[,1])
ranks2 <- rankings(abilities)

## Look at movement between the two rankings
change <- factor(rank(ranks2[,1]) - rank(ranks[,1]))
barplot(xtabs(~change), xlab = "Change in Rank", ylab = "No. Teams")

## Take out regional winners and look at top 10
regional <- c("RIT", "Alabama-Huntsville", "Michigan", "Cornell", "Boston College",
              "North Dakota")

ranks <- ranks[!rownames(ranks) %in% regional]
ranks2 <- ranks2[!rownames(ranks2) %in% regional]

## compare the 10 at-large selections under both rankings
## with those selected under NCAA rankings
cbind(names(sort(ranks, decr = TRUE)[1:10]),
      names(sort(ranks2, decr = TRUE)[1:10]),
      c("Miami", "Denver", "Wisconsin", "St. Cloud State",
        "Bemidji State", "Yale", "Northern Michigan", "New Hampshire",
        "Alsaka", "Vermont"))





