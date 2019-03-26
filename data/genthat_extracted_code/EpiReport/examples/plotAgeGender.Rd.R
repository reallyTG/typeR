library(EpiReport)


### Name: plotAgeGender
### Title: Age and Gender bar graph
### Aliases: plotAgeGender
### Keywords: age bargraph gender

### ** Examples

# --- Create dummy data
mydat <- data.frame(Gender=c("F", "F", "M", "M"),
AgeGroup = c("0-65", "65+", "0-65", "65+"),
NumberOfCases = c(54,43,32,41))

# --- Plot the dummy data
plotAgeGender(mydat,
              xvar = "AgeGroup",
              yvar = "NumberOfCases",
              group = "Gender",
              ytitle = "Number of cases")




