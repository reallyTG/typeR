library(ape)


### Name: base.freq
### Title: Base frequencies from DNA Sequences
### Aliases: base.freq GC.content Ftab
### Keywords: univar manip

### ** Examples

data(woodmouse)
base.freq(woodmouse)
base.freq(woodmouse, TRUE)
base.freq(woodmouse, TRUE, TRUE)
GC.content(woodmouse)
Ftab(woodmouse)
Ftab(woodmouse[1, ], woodmouse[2, ]) # same than above
Ftab(woodmouse[14:15, ]) # between the last two



