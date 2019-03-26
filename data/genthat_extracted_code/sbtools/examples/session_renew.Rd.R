library(sbtools)


### Name: session_renew
### Title: Checks current session and re-authenticates if necessary
### Aliases: session_renew

### ** Examples

## Not run: 
##D # an empty call is sufficient if the session is current, 
##D # but will break if haven't been logged in before
##D session_renew()
##D 
##D # include a password if session may be expired
##D session_renew('newpass')
##D 
##D # optionally confirm the value of the current username
##D session_renew(username='olduser@usgs.gov', 'newpass')
## End(Not run)



