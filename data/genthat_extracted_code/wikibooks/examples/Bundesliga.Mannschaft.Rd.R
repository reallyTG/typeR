library(wikibooks)


### Name: Bundesliga.Mannschaft
### Title: Show all matches of one team during one or all seasons
### Aliases: Bundesliga.Mannschaft
### Keywords: datagen

### ** Examples

## select one season
data(Bundesliga)
Bundesliga.Mannschaft("FC Schalke 04", "2006/2007")

## use all seasons
data(Bundesliga)
Bundesliga.Mannschaft("FC Schalke 04")

## see a list of all teams of season 1993/1994:
unique(Bundesliga$Gast[Bundesliga$Saison=="1993/1994"])
Bundesliga.Mannschaft("1. FC Nuernberg", "1993/1994")



