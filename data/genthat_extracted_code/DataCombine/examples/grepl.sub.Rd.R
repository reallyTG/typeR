library(DataCombine)


### Name: grepl.sub
### Title: Subset a data frame if a specified pattern is found in a
###   character string
### Aliases: grepl.sub

### ** Examples

# Create data frame
ABData <- data.frame(a = c("London, UK", "Oxford, UK", "Berlin, DE",
                    "Hamburg, DE", "Oslo, NO"),
                    b = c(8, 0.1, 3, 2, 1))

# Keep only data from Germany (DE)
ABGermany <- grepl.sub(data = ABData, pattern = "DE", Var = "a")




