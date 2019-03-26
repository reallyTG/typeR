library(wru)


### Name: predict_race
### Title: Race prediction function.
### Aliases: predict_race

### ** Examples

data(voters)
predict_race(voters, surname.only = TRUE)
predict_race(voter.file = voters, surname.only = TRUE)
## Not run: predict_race(voter.file = voters, census.geo = "tract", census.key = "...")
## Not run: predict_race(voter.file = voters, census.geo = "tract", census.key = "...", age = T)
## Not run: predict_race(voter.file = voters, census.geo = "place", census.key = "...", sex = T)
## Not run: 
##D CensusObj <- get_census_data("...", state = c("NY", "DC", "NJ")); 
##D predict_race(voter.file = voters, census.geo = "tract", census.data = CensusObj, party = "PID")
## End(Not run)
## Not run: 
##D CensusObj2 <- get_census_data(key = "...", state = c("NY", "DC", "NJ"), age = T, sex = T); 
##D predict_race(voter.file = voters, census.geo = "tract", census.data = CensusObj2, age = T, sex = T)
## End(Not run)
## Not run: 
##D CensusObj3 <- get_census_data(key = "...", state = c("NY", "DC", "NJ"), census.geo = "place");
##D predict_race(voter.file = voters, census.geo = "place", census.data = CensusObj3)
## End(Not run)



