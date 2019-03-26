library(oce)


### Name: initializeFlagScheme,section-method
### Title: Establish a data-quality scheme for a section object
### Aliases: initializeFlagScheme,section-method

### ** Examples

data(section)
sectionWithFlags <- initializeFlagScheme(section, "WHP bottle")
station1 <- sectionWithFlags[["station", 1]]
str(station1[["flagScheme"]])



