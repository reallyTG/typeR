library(eegkit)


### Name: eegcapdense
### Title: Draws Dense EEG Cap with Selected Electrodes
### Aliases: eegcapdense

### ** Examples

##########   EXAMPLE 1   ##########

# plot 10-10 system (default):
eegcapdense()



##########   EXAMPLE 2   ##########

# plot 10-20 system:
eegcapdense("10-20", plotlabels = FALSE)



##########   EXAMPLE 3   ##########

# plot custom subset of electrodes
myelectrodes <- c("FP1","FP2","FPZ","F7","F3","FZ",
                  "F4","F8","T7","C3","CZ","C4","T8",
                  "P7","P3","PZ","P4","P8","O1","O2")
eegcapdense(myelectrodes)




