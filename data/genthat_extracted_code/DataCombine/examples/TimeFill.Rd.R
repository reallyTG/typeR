library(DataCombine)


### Name: TimeFill
### Title: Creates a continuous Unit-Time-Dummy data frame from a data
###   frame with Unit-Start-End times
### Aliases: TimeFill

### ** Examples

# Create fake data

Country = c('Panama', 'Korea', 'Korea', 'Germany', 'Finland')
Start = c(1995, 1980, 2004, 2000, 2012)
End = c(1995, 2001, 2010, 2002, 2014)

Data <- data.frame(Country, Start, End)

# TimeFill
FilledData <- TimeFill(Data, GroupVar = 'Country',
                 StartVar = 'Start', EndVar = 'End')

# Show selection from TimeFill-ed data
FilledData[90:100, ]




