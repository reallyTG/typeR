library(mrfDepth)


### Name: fom
### Title: Draws the Functional Outlier Map (FOM)
### Aliases: fom
### Keywords: Graphical

### ** Examples

data(octane)

# To construct the FOM, one first need to calculate 
# the functional outlyingness.
# Note that the option diagnostic in fOutl must be 
# set to TRUE. If not calling fom will result in an 
# error
Result <- fOutl(octane, alpha = 0, type = "fAO", diagnostic = TRUE);
fom(Result)

# The user may opt to draw a cut off line seperating the outliers.
# which will be plotted in red
fom(Result, cutoff = TRUE)

# Six observations are flagged as outliers. These correspond to 
# the sample with added ethanol. 




