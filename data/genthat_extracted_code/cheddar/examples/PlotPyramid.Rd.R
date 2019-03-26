library(cheddar)


### Name: Pyramid plots
### Title: Pyramid plots
### Aliases: PlotBPyramid PlotNPyramid
### Keywords: hplot

### ** Examples

data(TL84)

# Use a large left-hand margin to show level text
reset.par <- par(mar=c(5,8,1,1))

# Using prey-averaged trophic level
PlotNPyramid(TL84)

# Using chain-averaged of trophic level
PlotNPyramid(TL84, level=floor(ChainAveragedTrophicLevel(TL84)))

# Show by category
PlotNPyramid(TL84, level='category')

# Taxonomic kingdoms as levels
PlotNPyramid(TL84, level='kingdom')

# Taxonomic kingdoms as levels, with a defined order
PlotNPyramid(TL84, level='kingdom', expected.levels=c("<unnamed>", "Plantae", 
             "Chromista","Bacteria","Protozoa","Animalia"))


# Compare the YthanEstuary and the TL84 datasets. YthanEstuary has nodes in 
# each of the categories whereas TL84 only has producer, invertebrate and 
# vert.ecto nodes. Show categories that are not present in TL84
par(mfrow=c(1,2))
data(YthanEstuary)
xlim <- range(c(Log10N(TL84), Log10N(YthanEstuary)), na.rm=TRUE)
PlotNPyramid(TL84, level='category', xlim=xlim, 
             expected.levels=c('<unnamed>', 'producer', 'invertebrate', 
                               'vert.ecto', 'vert.endo'))
PlotNPyramid(YthanEstuary, level='category',  xlim=xlim)
par(mfrow=c(1,1))


# For the BroadstoneStream dataset, the LongestTrophicLevel function returns 
# nodes in levels 1 and 7 to 10 but no nodes in levels 2 to 6. 
# By default all levels between the minimum and maximum are shown, so levels 
# 2 to 6 appear with no boxes.
data(BroadstoneStream)
PlotNPyramid(BroadstoneStream, 
             level=floor(LongestTrophicLevel(BroadstoneStream)))

# Set fill.missing.levels to FALSE to prevent levels 2 to 6 from being drawn.
PlotNPyramid(BroadstoneStream, 
             level=floor(LongestTrophicLevel(BroadstoneStream)), 
             fill.missing.levels=FALSE)

par(reset.par)



