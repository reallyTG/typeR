library(sound)


### Name: plot.Sample
### Title: Plot a Sample Object
### Aliases: plot.Sample
### Keywords: hplot

### ** Examples
## Not run: 
##D s <- Sine(440,1) + .4*Sine(1000,1)
##D plot(s[1:1000])
##D play(s)
##D s <- normalize(s)
##D plot(s[1:1000])  # now the range of the waveform is in [-1,1]
##D play(s)  # no cracks!
## End(Not run)



