library(muRL)


### Name: zips
### Title: A .tab file of US ZIP code data for mapping recipients
### Aliases: zips
### Keywords: datasets

### ** Examples

data(zips)

summary(zips$lat)
summary(zips$lon)

## Extracting latitude and longitude.
## Create a sample survey data frame with an ID variable, 
##   respondent ZIP code, state, and survey response:
svy1 <- data.frame(id = c(1,2,3,4), zip = c("10001", "10001", "63130", "380HH"), 
          state = c("NY", "NY", "MO", "AR"), resp = c(1,2,1,5))
svy1
## Since ZIP 380HH spans three states, all are included:
svy2 <- merge(svy1, zips, by = "zip", all.x = TRUE) 
svy2
## Merging by ZIP and state omits the duplicate 380HH entries:
svy3 <- merge(svy1, zips, by = c("zip", "state"), all.x = TRUE)
svy3



