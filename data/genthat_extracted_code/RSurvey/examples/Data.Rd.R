library(RSurvey)


### Name: Data
### Title: Set or Query Data and Parameters
### Aliases: Data
### Keywords: sysdata

### ** Examples

# set a parameter
Data("test1", 3.14159265)
Data("test2", list(id = "PI", val = 3.14159265))

# retrieve a parameter value
Data("test1")
Data("test2")
Data(c("test2", "id"))
Data(c("test2", "val"))

# get all parameter values
d <- Data()

# remove all saved parameter values
Data(replace.all = list())

# recover saved parameter values
Data(replace.all = d)




