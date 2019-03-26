library(EdSurvey)


### Name: getData
### Title: Read Data to a Data Frame
### Aliases: getData

### ** Examples

# read in the example data (generated, not real student data)
sdf <- readNAEP(system.file("extdata/data", "M36NT2PM.dat", package = "NAEPprimer"))

# get two variables, without weights
df <- getData(data=sdf, varnames=c("dsex", "b017451"))
table(df)

# example of using recode
df2 <- getData(data=sdf, varnames=c("dsex", "t088301"),
               recode=list(t088301=list(from=c("Yes, available","Yes, I have access"),
                                        to=c("Yes")),
                           t088301=list(from=c("No, have no access"),
                                        to=c("No"))))
table(df2)

# When readNAEP is called on a data file, it appends a default 
# condition to the edsurvey.data.frame. You can see these conditions
# by printing the sdf
sdf

# As per the default condition specified, getData restricts the data to only
# Reporting Sample. This behavior can be changed as follows:
df2 <- getData(data=sdf, varnames=c("dsex", "b017451"), defaultConditions = FALSE)
table(df2)

# Similarly, the default behavior of omitting certain levels specified
# in the edsurvey.data.frame can be changed as follows:
df2 <- getData(data=sdf, varnames=c("dsex", "b017451"), omittedLevels = FALSE)
table(df2)

# the variable "c052601" is from the school-level data file; merging is handled automatically
# returns a light.edsurvey.data.frame using addAttributes=TRUE argument
gddat <- getData(data=sdf, 
                 varnames=c("composite", "dsex", "b017451","c052601"),
                 addAttributes = TRUE)
class(gddat)
# look at the first few lines
head(gddat)



