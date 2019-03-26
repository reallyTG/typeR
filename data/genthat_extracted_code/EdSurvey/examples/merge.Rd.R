library(EdSurvey)


### Name: merge
### Title: EdSurvey Merge
### Aliases: merge merge.light.edsurvey.data.frame

### ** Examples

# Read in NAEP primer data
sdf <- readNAEP(system.file("extdata/data", "M36NT2PM.dat", package = "NAEPprimer"))
lsdf <- getData(data=sdf, varnames=c("dsex", "b017451"), addAttributes = TRUE)
df <- data.frame(dsex = c("Male","Female"), dsex2 = c("Boy","Girl"))

# Merging a light.edsurvey.data.frame with a data.frame
# returns a light.edsurvey.data.frame object
merged_lsdf <- merge(lsdf,df, by = "dsex")
class(merged_lsdf) #  "light.edsurvey.data.frame" "data.frame"
head(merged_lsdf) # shows merge results

# Merging behaves similarly to base::merge
df2 <- data.frame(dsex = c("Male","Female"), b017451 = c(1,2))
merged_lsdf2 <- merge(lsdf,df2, by = "dsex")
names(merged_lsdf2) # "dsex"      "b017451.x" "b017451.y"
head(merged_lsdf2) # shows merge results




