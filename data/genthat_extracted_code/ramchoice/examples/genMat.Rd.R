library(ramchoice)


### Name: genMat
### Title: ramchoice Package: Generate Matrices of Constraints
### Aliases: genMat

### ** Examples

# load data
data(ramdata)

# summary statistics
summaryStats <- sumData(menu, choice)

# constraints
constraints <- genMat(summaryStats$sumMenu, summaryStats$sumMsize)
constraints$ConstN
constraints$R[1:10, 1:10]




