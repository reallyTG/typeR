library(dpcR)


### Name: adpcr2panel
### Title: Convert adpcr object to array
### Aliases: adpcr2panel
### Keywords: manip

### ** Examples

#generate data
ttest <- sim_adpcr(m = 400, n = 765, times = 20, pos_sums = FALSE, 
                   n_panels = 3)
#convert object into three arrays
arrays <- adpcr2panel(ttest)
length(arrays)
#print an array
arrays[[1]]



