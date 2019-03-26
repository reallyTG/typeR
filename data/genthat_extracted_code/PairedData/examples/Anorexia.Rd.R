library(PairedData)


### Name: Anorexia
### Title: Anorexia data from Pruzek & Helmreich (2009)
### Aliases: Anorexia
### Keywords: datasets

### ** Examples

data(Anorexia)

# Visualization of the cluster
with(Anorexia,plot(paired(Prior,Post),type="profile"))

# The effects of trimming or winsorizing 
# with 4 outliers (n=17)
17*0.2
with(Anorexia,summary(paired(Prior,Post)))
17*0.25
with(Anorexia,summary(paired(Prior,Post),tr=0.25))



