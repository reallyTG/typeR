library(fbRanks)


### Name: create.fbRanks.dataframes
### Title: Helper Function to Construct the Scores and Teams Data Frames
###   from csv files.
### Aliases: create.fbRanks.dataframes

### ** Examples

## Not run: 
##D #This shows how a series of .csv files can be imported to create
##D #a scores and teams data frames
##D 
##D #this is the list of files with the league data
##D match.files = c(
##D   "OPL NPL.csv", "OPL 1st Div.csv",
##D   "OPL 2nd Div.csv", "OPL 3rd Div.csv","OPL 4th Div.csv",
##D )
##D #In this case the team file is a single file, but it could be a list
##D team.file="teams_b00.csv"
##D #This does error-checking and outputs dataframes in the proper format
##D b00_data=create.fbRanks.dataframes(scores.file=match.files, teams.file=team.file, date.format="##D 
##D 
## End(Not run)



