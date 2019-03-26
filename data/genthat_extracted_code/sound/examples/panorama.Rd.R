library(sound)


### Name: panorama
### Title: Narrow the Panorama of a Stereo Sample
### Aliases: panorama
### Keywords: manip

### ** Examples
## Not run: 
##D s <- stereo(Sine(440,1),Sine(330,1))
##D play(s)
##D play(panorama(s,30))  # now right and left tones are closer to the center
##D play(panorama(s,10))  # now even closer
##D play(panorama(s,0))   # now both at the center, the same as setChannels(s,1)
##D play(panorama(s,-30)) # again wider, but both sides switched
##D play(panorama(s,-50)) # the same as mirror(s)
## End(Not run)


