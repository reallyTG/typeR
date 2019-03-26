library(Lahman)


### Name: Schools
### Title: Schools table
### Aliases: Schools
### Keywords: datasets

### ** Examples


require("dplyr")

# How many different schools are listed in each state?
table(Schools$state)
 
# How many different schools are listed in each country?
table(Schools$country)

# Top 20 schools 
schoolInfo <- Schools %>% select(-country)

schoolCount <- CollegePlaying %>%
                 group_by(schoolID) %>%
                 summarise(players = length(schoolID)) %>%
                 left_join(schoolInfo, by = "schoolID") %>%
                 arrange(desc(players)) 
head(schoolCount, 20)

# sum counts by state
schoolStates <- schoolCount %>%
                  group_by(state) %>%
                  summarise(players = sum(players),
                            schools = length(state))
str(schoolStates)
summary(schoolStates)

## Not run: 
##D if(require(zipcode)) {
##D   # in lieu of more precise geocoding via schoolName, 
##D   # find lat/long of Schools from zipcode file
##D   zips <- zipcode %>%
##D             group_by(city, state) %>%
##D             summarise(latitude=mean(latitude), 
##D                       longitude=mean(longitude))
##D   names(zips)[1:2] <- c("city", "state")  
##D   str(zips)
##D 
##D   # merge lat/long from zips
##D   schoolsXY <- merge(Schools, zips, by=c("city", "state"), all.x=TRUE)
##D   str(schoolsXY)
##D 
##D   # plot school locations
##D   with(subset(schoolsXY, schoolState != 'HI'),
##D     plot(jitter(longitude), jitter(latitude))
##D   )
##D }
## End(Not run)




