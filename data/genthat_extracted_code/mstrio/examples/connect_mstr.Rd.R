library(mstrio)


### Name: connect_mstr
### Title: Create a MicroStrategy REST API connection
### Aliases: connect_mstr

### ** Examples

## No test: 
# Connect to a MicroStrategy environment
con <- connect_mstr(base_url = "https://demo.microstrategy.com/MicroStrategyLibrary/api",
                    username = "user",
                    password = "password",
                    project_name = "Financial Reporting")

# A good practice is to disconnect once you're done
# In case you forget, the server will disconnect the session after some time has passed
close(con)
## End(No test)



