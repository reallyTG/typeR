## ---- eval=FALSE---------------------------------------------------------
#  library(baseballDBR)
#  # Load data from Baseball Databank
#  get_bbdb(table = c("Batting", "Pitching", "Fielding"))
#  
#  Batting <- wOBA(Batting, Pitching, Fielding, Fangraphs = T)
#  head(Batting, 3)

## ---- eval=FALSE---------------------------------------------------------
#  library(baseballDBR)
#  library(dplyr)
#  get_bbdb(table = c("Batting", "Pitching", "Fielding"))
#  
#  Batting$f_wOBA <- wOBA(Batting, Pitching, Fielding, Fangraphs = T)
#  
#  Batting$t_wOBA <- wOBA(Batting, Pitching, Fielding, Fangraphs = F)
#  
#  # Going to subset for players who had more than 100 at-bats and played in at least eighty games.
#  # This shoul eliminate most of the pitchers and minor league call-ups.
#  Batting_2016 <- subset(Batting, yearID >= 2016 & AB >= 100 & G >= 80) %>%
#      arrange(desc(t_wOBA))
#  
#  head(Batting_2016)
#  

## ---- eval=FALSE---------------------------------------------------------
#  library(baseballDBR)
#  # Load data from Baseball Databank
#  get_bbdb(table = c("Batting", "Pitching", "Fielding"))
#  
#  # Run wOBA values for seperate leagues
#  w_vals <- wOBA_values(BattingTable = Batting, FieldingTable = Fielding, PitchingTable = Pitching, Sep.Leagues = TRUE)
#  

## ---- eval=FALSE---------------------------------------------------------
#  head(w_vals)

