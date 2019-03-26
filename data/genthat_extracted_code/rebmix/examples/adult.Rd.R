library(rebmix)


### Name: adult
### Title: Adult Dataset
### Aliases: adult
### Keywords: datasets

### ** Examples

data("adult")

# Find complete cases.

adult <- adult[complete.cases(adult),]

# Show level attributes for binary and discrete variables.

levels(adult[["Type"]])
levels(adult[["Workclass"]])
levels(adult[["Education"]])
levels(adult[["Marital.Status"]])
levels(adult[["Occupation"]])
levels(adult[["Relationship"]])
levels(adult[["Race"]])
levels(adult[["Sex"]])
levels(adult[["Native.Country"]])
levels(adult[["Income"]])

save(adult, file = "adult_complete_cases.rda")



