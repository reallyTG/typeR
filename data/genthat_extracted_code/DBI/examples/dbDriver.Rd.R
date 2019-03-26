library(DBI)


### Name: dbDriver
### Title: Load and unload database drivers
### Aliases: dbDriver dbUnloadDriver

### ** Examples

# Create a RSQLite driver with a string
d <- dbDriver("SQLite")
d

# But better, access the object directly
RSQLite::SQLite()



