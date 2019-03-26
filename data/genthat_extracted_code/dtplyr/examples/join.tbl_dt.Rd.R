library(dtplyr)


### Name: join.tbl_dt
### Title: Join data table tbls.
### Aliases: join.tbl_dt inner_join.data.table left_join.data.table
###   right_join.data.table semi_join.data.table anti_join.data.table
###   full_join.data.table

### ** Examples

library(dplyr, warn.conflicts = FALSE)

if (require("Lahman")) {
batting_dt <- tbl_dt(Batting)
person_dt <- tbl_dt(Master)

# Inner join: match batting and person data
inner_join(batting_dt, person_dt)

# Left join: keep batting data even if person missing
left_join(batting_dt, person_dt)

# Semi-join: find batting data for top 4 teams, 2010:2012
grid <- expand.grid(
  teamID = c("WAS", "ATL", "PHI", "NYA"),
  yearID = 2010:2012)
top4 <- semi_join(batting_dt, grid, copy = TRUE)

# Anti-join: find batting data with out player data
anti_join(batting_dt, person_dt)
}



