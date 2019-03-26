library(EdSurvey)


### Name: subset
### Title: EdSurvey Subset
### Aliases: subset subset.edsurvey.data.frame
###   subset.edsurvey.data.frame.list subset.light.edsurvey.data.frame

### ** Examples

# read in the example data (generated, not real student data)
sdf <- readNAEP(system.file("extdata/data", "M36NT2PM.dat", package = "NAEPprimer"))

# table to compare to subsequent tables with subsets
edsurveyTable(composite ~ dsex, data=sdf, returnMeans=FALSE, returnSepct=FALSE)

# subset to just males
newsdf <-  subset(x=sdf, subset= dsex == "Male") 
# table of dsex after subset
edsurveyTable(composite ~ dsex, data=newsdf, returnMeans=FALSE, returnSepct=FALSE)

# Variable names that are not in the sdf get resolved in the parent frame.
# Practically, that means that the following two subset 
# calls sdfM1 and sdfM2 do the same thing
male_var <- "Male"
sdfM1 <- subset(x=sdf, subset= dsex == male_var)
sdfM2 <- subset(x=sdf, subset= dsex == "Male")
table(getData(data=sdfM1, varnames="dsex"))
table(getData(data=sdfM2, varnames="dsex"))

# variable can also be resolved as members of lists
genders <- c("Male", "Female","not a sex level")
sdfn <- subset(x=sdf, subset= dsex == genders[2]) 
table(getData(data=sdfn, varnames="dsex"))

# variables can also be subset using %in%
sdfM3 <- subset(x=sdf, subset= dsex %in% c("Male", "not a sex level")) 
table(getData(data=sdfM3, varnames="dsex"))

# if you need to call a name on the sdf dynamically, you can use as.name
dsex_standin <- as.name("dsex")
sdfM4 <- subset(x=sdf, subset= dsex_standin == "Male")
table(getData(data=sdfM4, varnames="dsex"))

# Here is an example of how one might want to call
# subset from within a function or loop.
# First, define a few variables to use dynamically
rhs_vars <- c("dsex", "b017451")
lvls <- c("Male", "Female")

# create a parsed condition
cond <- parse(text=paste0(rhs_vars[1], " == \"",lvls[1],"\""))[[1]]

# when inside=TRUE a parsed condition can be passed to subset
dsdf <- subset(x=sdf, subset=cond, inside=TRUE)

# check the result
table(getData(data=dsdf, varnames="dsex"))

# returns data, but uses substantial memory
## Not run: 
##D sdf[1:3, "origwt"]
##D head(sdf[c("origwt","m145101")])
##D sdf[1:3, c("origwt","m145101")]
##D sdf[1:3,]
##D head(sdf[,14])
##D head(sdf[,10:14])
##D 
##D # subset an edsurvey.data.frame.list
##D sdfA <- subset(sdf, scrpsu %in% c(5,45,56))
##D sdfB <- subset(sdf, scrpsu %in% c(75,76,78))
##D sdfC <- subset(sdf, scrpsu %in% 100:200)
##D sdfD <- subset(sdf, scrpsu %in% 201:300)
##D 
##D # construct an edsurvey.data.frame.list from these four datasets
##D sdfl <- edsurvey.data.frame.list(list(sdfA, sdfB, sdfC, sdfD),
##D                                  labels=c("A locations",
##D                                            "B locations",
##D                                            "C locations",
##D                                            "D locations"))
##D 
##D sdfl2 <- subset(sdfl, dsex=="Male")
##D # the number of rows in each element of the sdfl
##D nrow(sdfl)
##D # the number of rows after subsetting each element to just the Males
##D nrow(sdfl2)
## End(Not run)



