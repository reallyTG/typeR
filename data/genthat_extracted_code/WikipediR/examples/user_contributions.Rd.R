library(WikipediR)


### Name: user_contributions
### Title: Retrieve user contributions
### Aliases: user_contributions

### ** Examples


#Retrieve the timestamps of a user's recent contributions to the English-language Wikipedia
contribs <- user_contributions("en", "wikipedia", username = "Ironholds",
                              properties = "timestamp")

#Retrieve the timestamps of a user's recent contributions to a non-Wikimedia wiki.
rw_contribs <- user_contributions(domain = "rationalwiki.org", username = "David Gerard",
                                 properties = "ids", limit = 1)
                           



