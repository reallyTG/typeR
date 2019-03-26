library(dpcR)


### Name: qpcr_analyser
### Title: qPCR Analyser
### Aliases: qpcr_analyser qpcr_analyser-methods qpcr_analyser,adpcr-method
###   qpcr_analyser,data.frame-method qpcr_analyser,modlist-method
### Keywords: Cy0 amplification qPCR quantification real-time

### ** Examples


# Take data of guescini1 data set from the qpcR R package.
library(qpcR)
# Use the first column containing the cycles and the second column for sample F1.1.
data(guescini1)
qpcr_analyser(guescini1, cyc = 1, fluo = 2)

# Use similar setting as before but set takeoff to true for an estimation of
# the first significant cycle of the exponential region.
qpcr_analyser(guescini1, cyc = 1, fluo = 2, takeoff = TRUE)

# Use similar setting as before but use qpcr_analyser in a loop to calculate the results for the
# first four columns containing the fluorescence in guescini1
print(qpcr_analyser(guescini1, cyc = 1, fluo = 2:5, takeoff = TRUE))

# Run qpcr_analyser on the list of models (finer control on fitting model process)
models <- modlist(guescini1)
qpcr_analyser(models)




