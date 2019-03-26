library(Lahman)


### Name: AwardsPlayers
### Title: AwardsPlayers table
### Aliases: AwardsPlayers
### Keywords: datasets

### ** Examples

data(AwardsPlayers)
# Which awards have been given and how many?
with(AwardsPlayers, table(awardID))
awardtab <- with(AwardsPlayers, table(awardID))

# Plot the awardtab table as a Cleveland dot plot
library("lattice")
dotplot(awardtab)

# Restrict to MVP awards
mvp <- subset(AwardsPlayers, awardID == "Most Valuable Player")
# Who won in 1994?
mvp[mvp$yearID == 1994L, ]

goldglove <- subset(AwardsPlayers, awardID == "Gold Glove")
# which players won most often?
GGcount <- table(goldglove$playerID)
GGcount[GGcount>10]

# Triple Crown winners
subset(AwardsPlayers, awardID == "Triple Crown")

# Simultaneous Triple Crown and MVP winners
# (compare merged file to TC)
TC <- subset(AwardsPlayers, awardID == "Triple Crown")
MVP <- subset(AwardsPlayers, awardID == "Most Valuable Player")
keepvars <- c("playerID", "yearID", "lgID.x")
merge(TC, MVP, by = c("playerID", "yearID"))[ ,keepvars]





