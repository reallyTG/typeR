library(eegkit)


### Name: eegcap
### Title: Draws EEG Cap with Selected Electrodes
### Aliases: eegcap

### ** Examples

##########   EXAMPLE 1   ##########

# plot 10-10 system (default):

# plot full cap 2d (default options)
eegcap()

# plot full cap 2d (different color for ears and nose)
data(eegcoord)
mycols <- rep("white",87)
enames <- rownames(eegcoord)
mycols[enames=="A1"] <- "green"
mycols[enames=="A2"] <- "light blue"
mycols[enames=="NZ"] <- "pink"
eegcap(col.point = mycols)



##########   EXAMPLE 2   ##########

# plot 10-20 system:

# plot 2d cap with labels
eegcap("10-20")

# plot 2d cap without labels
eegcap("10-20", plotlabels = FALSE)



##########   EXAMPLE 3   ##########

# plot custom subset of electrodes
myelectrodes <- c("FP1","FP2","FPZ","F7","F3","FZ",
                  "F4","F8","T7","C3","CZ","C4","T8",
                  "P7","P3","PZ","P4","P8","O1","O2")
eegcap(myelectrodes)




