library(rsyslog)


### Name: set_syslog_mask
### Title: Set the System Log Priority Mask
### Aliases: set_syslog_mask

### ** Examples

## Not run: 
##D open_syslog("my_script")
##D syslog("This message is visible.", level = "INFO")
##D set_syslog_mask("WARNING")
##D syslog("No longer visible.", level = "INFO")
##D syslog("Still visible.", level = "WARNING")
##D close_syslog()
## End(Not run)




