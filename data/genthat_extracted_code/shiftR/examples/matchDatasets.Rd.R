library(shiftR)


### Name: matchDatasets
### Title: Match Two Data Sets by Location
### Aliases: matchDatasets

### ** Examples


data1 = read.csv(text =
"chr,start,end,stat
chr1,100,200,1
chr1,150,250,2
chr1,200,300,3
chr1,300,400,4
chr1,997,997,5
chr1,998,998,6
chr1,999,999,7")

data2 = read.csv(text =
"chr,start,end,stat
chr1,130,130,1
chr1,140,140,2
chr1,165,165,3
chr1,200,200,4
chr1,240,240,5
chr1,340,340,6
chr1,350,350,7
chr1,360,360,8
chr1,900,900,9")

# Match data sets exactly.
matchDatasets(data1, data2, 0)

# Match data sets with a flank.
# The last records are now matched.
matchDatasets(data1, data2, 100)



