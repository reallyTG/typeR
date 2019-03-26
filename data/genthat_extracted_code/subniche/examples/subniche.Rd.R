library(subniche)


### Name: subniche
### Title: The Within Outlying Mean Indexes calculation
### Aliases: subniche print.subniche plot.subniche margvect subplot
###   summary.subniche refparam rtest.subniche subparam.refor rtestrefor
###   subparam.subor rtestsubor print.subkrandtest print.subnikrandtest
###   print.subniche plot.subniche margvect subplot summary.subniche
###   refparam rtest.subniche subparam.refor rtestrefor subparam.subor
###   rtestsubor subkrandtest subnikrandtest
### Keywords: subniche

### ** Examples

library(subniche)
data(doubs)
dudi1 <- dudi.pca(doubs$env, scale = TRUE, scan = FALSE, nf = 3)
nic1 <- niche(dudi1, doubs$fish, scann = FALSE)
# number of sites
N <- dim(nic1$ls)[1]
#Create a factor which defines the subsets
fact <- factor(c(rep(1,N/2),rep(2,N/2)))
# nic1 will be use as reference and fact will be use to define the subniches environment
subnic1 <- subniche(nic1, fact)
# the following two functions do the same display, plot.refniche is adapted to subniche objects
plot(nic1)
plot(subnic1)
#Display the marginality vector of the suborigins and the species subniche
margvect(subnic1)
#Display the subset's polygon, found within the overall environment's chull,
#and the corresponding species positions
subplot(subnic1)
# The following two functions do the same display, refparam is adapted to subniche objects
niche.param(nic1)
refparam(subnic1)
# The following two functions do the same display, rtest is adapted to subniche objects
rtest(nic1,10)
rtest(subnic1,10)
#Calculates the subniches' parameters from G with the corresponding rtest
subparam.refor(subnic1)
rtestrefor(subnic1,10)
#Calculates the subniches' parameters from G_k with the corresponding rtest
subparam.subor(subnic1)
rtestsubor(subnic1,10)



