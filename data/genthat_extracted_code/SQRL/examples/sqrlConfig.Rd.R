library(SQRL)


### Name: sqrlConfig
### Title: Configuration Files
### Aliases: sqrlConfig
### Keywords: file

### ** Examples

# Define a new source (not from file).
sqrlSource("Orac", "Dbq=Delphi;Uid=Pythia;Pwd=<pwd>",
            "Driver={Oracle in OraClient11g_home1}")

# Review the current configuration (parameter values).
Orac("config")

## Not run: 
##D # Configure an existing source from file.
##D Orac("config", "my/config/file")
##D 
##D # Set one named parameter from file.
##D Orac(connection = "my/other/file")
##D 
##D # Define and configure a new source from file.
##D sqrlSource("Zen", "my/other/", "file")
## End(Not run)



