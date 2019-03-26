library(REDCapR)


### Name: retrieve_token
### Title: Read a token from a (non-REDCap) database.
### Aliases: retrieve_token retrieve_token_mssql

### ** Examples

library(REDCapR) #Load the package into the current R session.
## Not run: 
##D # ---- SQL Server Example ----------------------------
##D # Rely on `retrieve_token()` to create & destory the channel.
##D dsn      <- "TokenSecurity"
##D project  <- "DiabetesSurveyProject"
##D token    <- retrieve_token(dsn=dsn, project_name=project)
##D 
##D # Create & close the channel yourself, to optimize repeated calls.
##D dsn      <- "TokenSecurity"
##D project1 <- "DiabetesSurveyProject1"
##D project2 <- "DiabetesSurveyProject2"
##D project3 <- "DiabetesSurveyProject3"
##D 
##D channel  <- RODBC::odbcConnect(dsn=dsn)
##D token1   <- retrieve_token(dsn=dsn, project_name=project1)
##D token2   <- retrieve_token(dsn=dsn, project_name=project2)
##D token3   <- retrieve_token(dsn=dsn, project_name=project3)
##D RODBC::odbcClose(channel)
## End(Not run)



