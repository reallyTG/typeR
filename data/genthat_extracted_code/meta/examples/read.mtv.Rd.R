library(meta)


### Name: read.mtv
### Title: Import RevMan 4 data files (.mtv)
### Aliases: read.mtv
### Keywords: datagen

### ** Examples

# Locate MTV-data file "FLEISS93.MTV" in sub-directory of package "meta"
#
filename <- system.file("extdata/Fleiss93.MTV", package = "meta")
#
fleiss93.cc <- read.mtv(filename)

# Same result as R Command example(Fleiss93):
#
metabin(event.e, n.e, event.c, n.c,
        data=fleiss93.cc, subset=type=="D",
        studlab=paste(studlab, year))

# Same result: example(Fleiss93cont)
#
metacont(n.e, mean.e, sd.e, n.c, mean.c, sd.c,
         data=fleiss93.cc, subset=type=="C",
         studlab=paste(studlab, year))



