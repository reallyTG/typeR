library(sound)


### Name: mirror
### Title: Mirror a Stereo Sample
### Aliases: mirror
### Keywords: manip

### ** Examples
## Not run: 
##D s <- stereo(Sine(440,1),Sine(220,1))
##D play(s)  # higher tone is on the left
##D play(mirror(s))  # now higher tone is on the right
## End(Not run)


