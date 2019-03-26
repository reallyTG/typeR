library(nplplot)


### Name: nplplot
### Title: Plotting statistics along a chromosome
### Aliases: nplplot
### Keywords: plotting

### ** Examples

# plot with legend
par(omi=c(0.05, 0.05, 0.5, 0.05))
data(lods1, package="nplplot")
nplplot(plotdata=lods1, draw.lgnd=TRUE)

# plot without legend
data(lods2, package="nplplot")
nplplot(plotdata=lods2, draw.lgnd=FALSE)

# plotting from a data file
datadir <- paste(system.file("data", package="nplplot"), .Platform$file.sep, sep="")
nplplot(filename=paste(datadir, "lods2.txt.gz", sep=""))




