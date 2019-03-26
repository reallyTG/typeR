library(mmpp)


### Name: splitMPP
### Title: Split MPP Data by Sliding Time Window
### Aliases: splitMPP

### ** Examples

##The aftershock data of 26th July 2003 earthquake of M6.2 at the northern Miyagi-Ken Japan.
data(Miyagi20030626)
## time longitude latitude depth magnitude
## split events by 5-hours
sMiyagi <- splitMPP(Miyagi20030626,h=60*60*5,scaleMarks=TRUE)



