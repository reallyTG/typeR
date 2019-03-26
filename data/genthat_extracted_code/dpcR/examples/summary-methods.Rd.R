library(dpcR)


### Name: summary-methods
### Title: Methods for Function 'summary'
### Aliases: summary-methods summary,adpcr-method summary,dpcr-method
###   summary summary.adpcr summary.dpcr
### Keywords: methods utilities

### ** Examples


# array dpcr
# Simulates a chamber based digital PCR with m total number of template molecules  
# and n number of chambers per plate and assigns it as object ptest of the class 
# adpcr for a single panel. The summary function on ptest gets assigned to summ 
# and the result with statistics according to Dube et al. 2008 and Bhat et al. 2009 
# gets printed.
ptest <- sim_adpcr(m = 400, n = 765, times = 5, dube = FALSE, n_panels = 1)
summ <- summary(ptest) #save summary
print(summ)

# multiple experiments
# Similar to the previous example but with five panels
ptest <- sim_adpcr(m = 400, n = 765, times = 5, dube = FALSE, n_panels = 5)
summary(ptest)

# droplet dpcr - fluorescence
# Simulates a droplet digital PCR with m = 7 total number of template molecules 
# and n = 20 number of  droplets. The summary function on dropletf gives the 
# statistics according to Dube et al. 2008 and Bhat et al. 2009. The fluo parameter 
# is used to change the smoothness of the fluorescence curve and the space between
#  two consecutive measured peaks (droplets).
dropletf <- sim_dpcr(m = 7, n = 20, times = 5, fluo = list(0.1, 0))
summary(dropletf)

# droplet dpcr - number of molecules
# Similar to the previous example but with five panels but without and modifications
#  to the peaks.
droplet <- sim_dpcr(m = 7, n = 20, times = 5)
summary(droplet)

# Visualize the results of dropletf and dropletf
# The curves of dropletf are smoother.
par(mfrow = c(1,2))
plot(dropletf, main = "With fluo parameter", type = "l")
plot(droplet, main = "Without fluo parameter", type = "l")





