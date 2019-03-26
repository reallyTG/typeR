library(rsyslog)


### Name: open_syslog
### Title: Write Messages to the System Log
### Aliases: open_syslog syslog close_syslog

### ** Examples

## Not run: 
##D open_syslog("my_script")
##D syslog("Running script.", level = "INFO")
##D syslog("Possible issue.", level = "WARNING")
##D close_syslog()
##D 
##D # Opening the syslog is not strictly necessary. You can
##D # simply write a message and it will open the log with the
##D # process name (likely "R") as the default.
##D 
##D syslog("Hello from R!", level = "WARNING")
##D close_syslog()
## End(Not run)




