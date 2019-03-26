library(warbleR)


### Name: rm_channels
### Title: Remove channels in wave files
### Aliases: rm_channels

### ** Examples

{
# Set temporary working directory

# save sound file examples
data("Phae.long1")
Phae.long1.2 <- stereo(Phae.long1, Phae.long1)

writeWave(Phae.long1.2, "Phae.long1.2.wav")

rm_channels(channels = 1)

#check this floder
open_wd()
}




