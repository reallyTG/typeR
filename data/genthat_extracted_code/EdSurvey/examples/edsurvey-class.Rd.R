library(EdSurvey)


### Name: edsurvey.data.frame
### Title: EdSurvey Class Constructors
### Aliases: edsurvey.data.frame $.edsurvey.data.frame getAttributes
###   setAttributes

### ** Examples

# read in the example data (generated, not real student data)
sdf <- readNAEP(system.file("extdata/data", "M36NT2PM.dat", package="NAEPprimer"))

# Run a base R function on a column of edsurvey.data.frame
table(sdf$dsex)

# Extract default omitted levels of NAEP primer data
getAttributes(sdf, "omittedLevels") #[1] "Multiple" NA         "Omitted"

# Update default omitted levels of NAEP primer data
sdf <- setAttributes(sdf, "omittedLevels", c("Multiple", "Omitted", NA, "(Missing)"))
getAttributes(sdf, "omittedLevels") #[1] "Multiple"  "Omitted"   NA          "(Missing)"



