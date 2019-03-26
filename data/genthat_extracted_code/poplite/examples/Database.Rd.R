library(poplite)


### Name: Database-class
### Title: Class '"Database"'
### Aliases: Database Database-class columns,Database-method dbFile
###   dbFile,Database-method populate populate,Database-method schema
###   schema,Database-method tables,Database-method isOpen,Database-method
### Keywords: classes

### ** Examples


if (require(Lahman) && require(RSQLite))
{
 baseball.teams <- makeSchemaFromData(TeamsFranchises, name="team_franch")
 baseball.teams <- append(baseball.teams, makeSchemaFromData(Teams, name="teams"))
 
 relationship(baseball.teams, from="team_franch", to="teams") <- franchID ~ franchID
 
 baseball.db <- Database(baseball.teams, tempfile())
 
 tables(baseball.db)
 columns(baseball.db)
 schema(baseball.db)
 
 populate(baseball.db, teams=Teams, team_franch=TeamsFranchises)
 
 examp.con <- dbConnect(SQLite(), dbFile(baseball.db))
 
 dbListTables(examp.con)
 
 head(dbReadTable(examp.con, "teams"))
 head(dbReadTable(examp.con, "team_franch"))
 
 dbDisconnect(examp.con)
 
}




