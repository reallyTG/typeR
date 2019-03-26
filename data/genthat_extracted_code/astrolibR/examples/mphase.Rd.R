library(astrolibR)


### Name: mphase
### Title: Calculate the illuminated fraction of the Moon at given Julian
###   date(s)
### Aliases: mphase
### Keywords: misc

### ** Examples


mphase(2456877.5)

#  Plot the illuminated fraction of the moon for every day in July 
#  1996 at 0 TD (Greenwich noon).
#
# jd = jdcnv(1996, 7, 1, 0)         # Get Julian date of July 1
# phases = mphase(jd:(jd+31))       # Moon phase for all 31 days
# plot(1:31,phases)                 # Plot phase vs. July day number




