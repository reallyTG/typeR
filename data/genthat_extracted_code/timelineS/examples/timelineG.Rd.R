library(timelineS)


### Name: timelineG
### Title: Faceted Timelines for Grouped Data
### Aliases: timelineG

### ** Examples

### Plot timelines row-grouped by "Country"
timelineG(df = life_country, start = "Start", end = "End", names = "Name",
phase = "Phase", group1 = "Country")

### Plot timelines row-grouped by "Country" and column-grouped by "Gender"
timelineG(df = life_country, start = "Start", end = "End", names = "Name",
phase = "Phase", group1 = "Country", group2 = "Gender")

 ### Plot timelines, no group
timelineG(df = life_country, start = "Start", end = "End", names = "Name",color = "grey")




