library(antaresRead)


### Name: showAliases
### Title: show aliases for variables
### Aliases: showAliases setAlias

### ** Examples


# Display the short description of an alias
showAliases()

# Display the full description of an alias
showAliases("renewable")

## Not run: 
##D # Create a new alias that imports flows
##D setAlias("test", "short description", c("links", "FLOW LIN.")) 
##D showAliases()
## End(Not run)




