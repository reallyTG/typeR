library(WikipediR)


### Name: user_information
### Title: Retrieve user information
### Aliases: user_information

### ** Examples

#Retrieving information from a Wikimedia project
user_info <- user_information("en", "wikipedia", user_names = "David Gerard",
                             properties = "registration")

#Non-Wikimedia projects
user_info <- user_information(domain = "rationalwiki.org", user_names = "David Gerard",
                             properties = "registration")



