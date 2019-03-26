library(DataCombine)


### Name: FindReplace
### Title: Replace multiple patterns found in a character string column of
###   a data frame
### Aliases: FindReplace

### ** Examples

# Create original data
ABData <- data.frame(a = c("London, UK", "Oxford, UK", "Berlin, DE",
                     "Hamburg, DE", "Oslo, NO"),
                     b = c(8, 0.1, 3, 2, 1))

# Create replacements data frame
Replaces <- data.frame(from = c("UK", "DE"), to = c("England", "Germany"))

# Replace patterns and return full data frame
ABNewDF <- FindReplace(data = ABData, Var = "a", replaceData = Replaces,
                     from = "from", to = "to", exact = FALSE)

# Replace patterns and return the Var as a vector
ABNewVector <- FindReplace(data = ABData, Var = "a", replaceData = Replaces,
                     from = "from", to = "to", vector = TRUE)




