library(googleAnalyticsR)


### Name: ga_remarketing_build
### Title: Create a remarketing audience for creation
### Aliases: ga_remarketing_build

### ** Examples


## Not run: 
##D adword_list <- ga_adwords_list(123456, "UA-123456-1")
##D 
##D adword_link <- ga_adword(adword_list$id[[1]])
##D 
##D segment_list <- ga_segment_list()$items$definition
##D 
##D my_remarketing1 <- ga_remarketing_build(segment_list[[1]], 
##D                     state_duration = "TEMPORARY",
##D                     membershipDurationDays = 90, 
##D                     daysToLookBack = 14)
##D                     
##D my_remarketing2 <- ga_remarketing_build(segment_list[[2]], 
##D                      state_duration = "PERMANENT",
##D                      membershipDurationDays = 7, 
##D                      daysToLookBack = 31)
##D                      
##D # state based only can include exclusions
##D ga_remarketing_create(adwords_link = adword_link,
##D                      include = my_remarketing1, 
##D                      exclude = my_remarketing2,
##D                      audienceType = "STATE_BASED", 
##D                      name = "my_remarketing_seg1")
##D 
## End(Not run)



