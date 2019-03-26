library(tinyProject)


### Name: prOutputDefaults
### Title: Set default values of output functions
### Aliases: prOutputDefaults

### ** Examples


# Remove row names of table output:
prOutputDefaults(table = list(row.names = FALSE))

# Modify the default size of pdf output:
prOutputDefaults(pdf = list(width = 8, height = 6))

# Reset default values for pdf and table output
prOutputDefaults(table = NULL, pdf = NULL)




