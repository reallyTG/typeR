library(dbplyr)


### Name: join.tbl_sql
### Title: Join sql tbls.
### Aliases: join.tbl_sql inner_join.tbl_lazy left_join.tbl_lazy
###   right_join.tbl_lazy full_join.tbl_lazy semi_join.tbl_lazy
###   anti_join.tbl_lazy

### ** Examples

## Not run: 
##D library(dplyr)
##D if (has_lahman("sqlite")) {
##D 
##D # Left joins ----------------------------------------------------------------
##D lahman_s <- lahman_sqlite()
##D batting <- tbl(lahman_s, "Batting")
##D team_info <- select(tbl(lahman_s, "Teams"), yearID, lgID, teamID, G, R:H)
##D 
##D # Combine player and whole team statistics
##D first_stint <- select(filter(batting, stint == 1), playerID:H)
##D both <- left_join(first_stint, team_info, type = "inner", by = c("yearID", "teamID", "lgID"))
##D head(both)
##D explain(both)
##D 
##D # Join with a local data frame
##D grid <- expand.grid(
##D   teamID = c("WAS", "ATL", "PHI", "NYA"),
##D   yearID = 2010:2012)
##D top4a <- left_join(batting, grid, copy = TRUE)
##D explain(top4a)
##D 
##D # Indices don't really help here because there's no matching index on
##D # batting
##D top4b <- left_join(batting, grid, copy = TRUE, auto_index = TRUE)
##D explain(top4b)
##D 
##D # Semi-joins ----------------------------------------------------------------
##D 
##D people <- tbl(lahman_s, "Master")
##D 
##D # All people in half of fame
##D hof <- tbl(lahman_s, "HallOfFame")
##D semi_join(people, hof)
##D 
##D # All people not in the hall of fame
##D anti_join(people, hof)
##D 
##D # Find all managers
##D manager <- tbl(lahman_s, "Managers")
##D semi_join(people, manager)
##D 
##D # Find all managers in hall of fame
##D famous_manager <- semi_join(semi_join(people, manager), hof)
##D famous_manager
##D explain(famous_manager)
##D 
##D # Anti-joins ----------------------------------------------------------------
##D 
##D # batters without person covariates
##D anti_join(batting, people)
##D }
## End(Not run)



