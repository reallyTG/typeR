library(RChronoModel)


### Name: CreateMinMaxGroup
### Title: Constructing the minimum and the maximum for a group of
###   dates(phase)
### Aliases: CreateMinMaxGroup
### Keywords: Minimum of a group of dates Maximum of a group of dates

### ** Examples

    data(Events)
    Temp = CreateMinMaxGroup(Events, c(2,4), "Phase2")
    Temp = CreateMinMaxGroup(Events, c(3,5), "Phase1", Temp)



