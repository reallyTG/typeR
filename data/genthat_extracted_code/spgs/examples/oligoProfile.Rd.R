library(spgs)


### Name: oligoProfile
### Title: Oligo Profiles and Oligo Profile Correlation Plots of Nucleotide
###   Sequences
### Aliases: oligoProfile plot.OligoProfile print.OligoProfile oligoCorr
### Keywords: array

### ** Examples

data(nanoarchaeum)
#Get the 3-oligo profile of Nanoarchaeum without plotting it
nano.prof <- oligoProfile(nanoarchaeum, 3, plot=FALSE)
nano.prof #print oligo profile as percentages
print(nano.prof, units="count") #print oligo profile as counts
plot(nano.prof) #oligo profile plotted as percentages
plot(nano.prof, units="count") #plot it as counts

#plot the 2-oligo profile of Nanoarchaeum as proportions
oligoProfile(nanoarchaeum, k=3, units="proportion")



