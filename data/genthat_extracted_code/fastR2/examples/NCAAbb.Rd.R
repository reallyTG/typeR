library(fastR2)


### Name: NCAAbb
### Title: NCAA Division I Basketball Results
### Aliases: NCAAbb
### Keywords: datasets

### ** Examples


data(NCAAbb)
# select one year and add some additional variables to the data frame
NCAA2010 <-
  NCAAbb %>% 
  filter(season == "2009-10") %>%
  mutate(
    dscore = hscore - ascore,
    homeTeamWon = dscore > 0,
    numHomeTeamWon <- -1 + 2 * as.numeric(homeTeamWon),
    winner = ifelse(homeTeamWon, home, away),
    loser  = ifelse(homeTeamWon, away, home),
    wscore = ifelse(homeTeamWon, hscore, ascore),
    lscore = ifelse(homeTeamWon, ascore, hscore)
  )
NCAA2010 %>% select(date, winner, loser, wscore, lscore, dscore, homeTeamWon) %>% head()



