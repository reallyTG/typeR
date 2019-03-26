library(nplplot)


### Name: nplplot.multi
### Title: Plotting linkage or association statistics for multiple results
###   files
### Aliases: nplplot.multi
### Keywords: plotting

### ** Examples

datadir <- paste(system.file("data", package="nplplot"),
                 .Platform$file.sep, sep="")
f1 <- paste(datadir, "lods1.txt.gz", sep="")
f2 <- paste(datadir, "lods2.txt.gz", sep="")
h1 <- system.file("extdata","lods1header.R",package="nplplot")
h2 <- system.file("extdata","lods2header.R",package="nplplot")
nplplot.multi(c(f1, f2), col=1, row=2, output="screen", 
	     headerfiles=c(h1, h2), topmargin=0.5)



