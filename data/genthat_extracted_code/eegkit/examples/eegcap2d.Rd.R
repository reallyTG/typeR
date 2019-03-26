library(eegkit)


### Name: eegcap2d
### Title: Draws 2D EEG Cap
### Aliases: eegcap2d

### ** Examples


##########   EXAMPLE 1   ##########

# plot 10-10 system (default):

# plot full cap (default options)
eegcap2d()

# plot full cap (different color for ears and nose)
data(eegcoord)
mycols <- rep(NA, 87)
enames <- rownames(eegcoord)
mycols[enames=="A1"] <- "green"
mycols[enames=="A2"] <- "light blue"
mycols[enames=="NZ"] <- "pink"
eegcap2d(col.point = mycols)



##########   EXAMPLE 2   ##########

# plot 10-20 system:

# plot cap with labels
eegcap2d("10-20")

# plot cap without labels
eegcap2d("10-20", cex.label = -1)



##########   EXAMPLE 3   ##########

# plot custom subset of electrodes
myelectrodes <- c("FP1","FP2","FPZ","F7","F3","FZ",
                  "F4","F8","T7","C3","CZ","C4","T8",
                  "P7","P3","PZ","P4","P8","O1","O2")
eegcap2d(myelectrodes)




