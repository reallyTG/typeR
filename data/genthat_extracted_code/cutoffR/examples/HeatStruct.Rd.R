library(cutoffR)


### Name: HeatStruct
### Title: Structure Heatmap with Missing Value Demonstration
### Aliases: HeatStruct

### ** Examples

data(hqmr.data)
# use a subset of the hqmr.data
# notice the gold chunks which represent missing values
subdata <- hqmr.data[1000:1200, 1:30]
HeatStruct(subdata)
# change colors for high.col, low.col and missing.col
HeatStruct(subdata, low.col = "blue", high.col = "red", missing.col = "black")



