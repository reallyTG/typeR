library(pcrsim)


### Name: getParameter
### Title: Get Kit Parameters
### Aliases: getParameter

### ** Examples


# Returns vector of available kits.
getParameter()

# Returns vector of all methods.
getParameter(what="methods")

# Returns methods for specified kit.
getParameter(kit="SGMPlus", what="methods")

# Returns vector of available options.
getParameter(what="options")

# Returns vector of markers for specified kit.
getParameter(kit="SGMPlus", what="Marker")

# Returns data frame of all information for specified kit and method.
getParameter(kit="SGMPlus", method = "Default")



