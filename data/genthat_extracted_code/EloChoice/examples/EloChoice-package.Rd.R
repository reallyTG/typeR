library(EloChoice)


### Name: EloChoice-package
### Title: Preference Rating for Paired Visual Stimuli Based on Elo Ratings
### Aliases: EloChoice-package EloChoice
### Keywords: package

### ** Examples

data(physical)
res <- elochoice(winner = physical$Winner, loser = physical$Loser, runs = 2)
summary(res)
ratings(res, drawplot=FALSE)



