library(xRing)


### Name: selectProfiles
### Title: Select Profile(s)
### Aliases: selectProfiles

### ** Examples

if(interactive()){
# read a sample file
 im <- imRead(file = system.file("img", "AFO1046.1200dpi.png", package="xRing"))

# to display the image
  imDisplay(im)

# select a profile
  profile <- selectProfile(im)

# to display the profile
  plot(profile, type="l")
}




