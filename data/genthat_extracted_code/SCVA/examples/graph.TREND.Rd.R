library(SCVA)


### Name: graph.TREND
### Title: Plot a trend in central location
### Aliases: graph.TREND
### Keywords: Single-case design Graph Trend Vertical line plot Regression
###   line Running median

### ** Examples

data(AB)
graph.TREND(design = "AB", TREND = "VLP", CL = "mean", data = AB)
graph.TREND(design = "AB", TREND = "LSR", data = AB)
graph.TREND(design = "AB", TREND = "SM", data = AB)
graph.TREND(design = "AB", TREND = "RTL", data = AB)
graph.TREND(design = "AB", TREND = "RM3", data = AB)
graph.TREND(design = "AB", TREND = "RM5", data = AB)
graph.TREND(design = "AB", TREND = "RM42", data = AB)



