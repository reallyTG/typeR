library(poplite)


### Name: External methods
### Title: Specific methods for generics defined in external packages.
### Aliases: filter select
### Keywords: utilities

### ** Examples

  if (require(Lahman))
  {
      baseball.teams <- makeSchemaFromData(TeamsFranchises, name="team_franch")
      baseball.teams <- append(baseball.teams, makeSchemaFromData(Teams, name="teams"))
      
      relationship(baseball.teams, from="team_franch", to="teams") <- franchID ~ franchID
      
      baseball.db <- Database(baseball.teams, tempfile())
      
      populate(baseball.db, teams=Teams, team_franch=TeamsFranchises)
      
      select(baseball.db, .tables="teams")
      
      select(baseball.db, .tables=c("teams", "team_franch"))
      
      select(baseball.db, yearID:WCWin, franchName)
      
      filter(baseball.db, active == "Y")
      
      select(filter(baseball.db, active == "Y" & W > 50 & teamID == "CAL"), active, W, teamID)
  }



