library(poplite)


### Name: TableSchemaList-class
### Title: Class '"TableSchemaList"'
### Aliases: TableSchemaList-class TableSchemaList
###   createTable,TableSchemaList-method createTable
###   insertStatement,TableSchemaList-method insertStatement
###   mergeStatement,TableSchemaList-method mergeStatement
###   append,TableSchemaList,TableSchemaList-method columns
###   columns,TableSchemaList-method length length,TableSchemaList-method
###   relationship<- relationship<-,TableSchemaList-method constraint<-
###   constraint<-,TableSchemaList-method tables
###   tables,TableSchemaList-method
### Keywords: classes

### ** Examples


if (require(Lahman))
{
  baseball.teams <- new("TableSchemaList")
  
  franches <- makeSchemaFromData(TeamsFranchises, name="team_franch")
  
  baseball.teams <- append(baseball.teams, franches)
  
  teams <- makeSchemaFromData(Teams, name="teams")
   
  baseball.teams <- append(baseball.teams, teams)
    
  salaries <- makeSchemaFromData(Salaries, name="salaries")
  
  baseball.teams <- append(baseball.teams, salaries)
    
  relationship(baseball.teams, from="team_franch", to="teams") <- franchID ~ franchID
    
  relationship(baseball.teams, from="teams", to="salaries") <- teamID ~ teamID
  
  constraint(baseball.teams, "team_franch") <- ~franchID
  
  tables(baseball.teams)
  
  columns(baseball.teams)
  
}




