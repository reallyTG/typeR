## ---- eval=FALSE---------------------------------------------------------
#  library(baseballDBR)
#  # Load data from Baseball Databank
#  get_bbdb(table = c("Batting", "Pitching", "Fielding"))
#  
#  Batting$wRAA <- wRAA(Batting, Pitching, Fielding, Fangraphs=FALSE, NA_to_zero=TRUE, Sep.Leagues=FALSE)

## ---- eval=FALSE---------------------------------------------------------
#  library(baseballDBR)
#  # Load data from Baseball Databank
#  get_bbdb(table = c("Batting", "Pitching", "Fielding"))
#  
#  Batting$wRC <- wRC(Batting, Pitching, Fielding, Fangraphs=FALSE, NA_to_zero=TRUE, Sep.Leagues=FALSE)

