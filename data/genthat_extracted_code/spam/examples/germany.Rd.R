library(spam)


### Name: germany.plot
### Title: Plot administrative districts of Germany
### Aliases: germany.plot
### Keywords: hplot

### ** Examples

data( Oral)
germany.plot( Oral$Y/Oral$E)


# Plot the Bundeslaender:
germany.plot(germany.info$id%/%1000,col=rep(2:8,3), legend=FALSE)



