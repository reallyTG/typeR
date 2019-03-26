## ---- eval=FALSE---------------------------------------------------------
#  library(baseballDBR)
#  
#  # Grab the Pitching table from the Baseabll Databank
#  get_bbdb(table = "Pitching")
#  
#  Pitching$FIP <- FIP(Pitching, Fangraphs=FALSE, NA_to_zero=FALSE, Sep.Leagues=FALSE)
#  
#  

## ---- eval=FALSE---------------------------------------------------------
#  library(baseballDBR)
#  
#  fip_valz <- fip_values(Pitching, Fangraphs = FALSE, Sep.Leagues = FALSE)

