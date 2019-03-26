library(hht)


### Name: CombineTrials
### Title: Gather EEMD trial files
### Aliases: CombineTrials
### Keywords: ts

### ** Examples

#Suppose you have run 3 different EEMD sets of 100 trials each 
#and saved the results in EEMD1, EEMD2, EEMD3, respectively:
in.dirs <- c("/home/user/EEMD1", "/home/user/EEMD2/", "/home/user/EEMD3")
out.dir <- "/home/user/all.trials"
## Not run: CombineTrials(in.dirs, out.dir)
#Now all your trials should be located in /home/user/all.trials, 
#numbered 1 through 300



