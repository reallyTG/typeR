library(EpiReport)


### Name: plotAge
### Title: Age bar graph
### Aliases: plotAge
### Keywords: age bargraph

### ** Examples


# --- Create dummy data
mydat <- data.frame(AgeGroup = c("0-25", "26-65", "65+"),
                    NumberOfCases = c(54,32,41))

# --- Plot the dummy data
plotAge(mydat,
        xvar = "AgeGroup",
        yvar = "NumberOfCases",
        ytitle = "Number of cases")




