library(mstrio)


### Name: close
### Title: Closes a connection with MicroStrategy REST API
### Aliases: close close,connection-method

### ** Examples

## No test: 
# Connect to a MicroStrategy environment
con <- connect_mstr(base_url = "https://demo.microstrategy.com/MicroStrategyLibrary/api",
                    username = "user",
                    password = "password",
                    project_name = "Financial Reporting")

# A good practice is to disconnect once you're done
# However, the server will disconnect the session after some time has passed
close(con)
## End(No test)



