library(poplite)


### Name: Helper Functions
### Title: Functions to facilitate the creation of 'poplite'\'s data
###   structures.
### Aliases: makeSchemaFromData makeSchemaFromFunction correct.df.names
### Keywords: utilities

### ** Examples

  if (require(Lahman))
  { 
    franches <- makeSchemaFromData(TeamsFranchises, name="team_franch")
    show(franches)
    
    makeSchemaFromFunction(function(x) head(x),  name="team_franch", x=TeamsFranchises)

    test.df <- TeamsFranchises
    names(test.df)[1] <- "franch.ID"
    
    names(test.df)
    
    names(correct.df.names(test.df))
  }
  


