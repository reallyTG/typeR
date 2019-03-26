library(BioGeoBEARS)


### Name: get_probvals
### Title: Calculate probability of ordered discrete states using a maxent
###   distribution (equations 6.3-6.4 of Harte 2011)
### Aliases: get_probvals

### ** Examples

testval=1
# Examples
# Set up subplots
par(mfrow=c(3,2))

# Flat distribution (equal prob of any descendent size)
N = 6
# n = die_vals
die_vals = seq(1,N)
meanval = 3.5
probvals = get_probvals(die_vals, meanval)
probvals
barplot(height=probvals, width=1, names.arg=die_vals, ylim=c(0,1))
title(paste("Probabilities of each state, mean val=", meanval, sep=""))

# Descendents tend to have large ranges
N = 6
# n = die_vals
die_vals = seq(1,N)
meanval = 5.999
probvals = get_probvals(die_vals, meanval)
probvals
barplot(height=probvals, width=1, names.arg=die_vals, ylim=c(0,1))
title(paste("Probabilities of each state, mean val=", meanval, sep=""))

# Flat distribution (equal prob of any descendent size)
N = 6
# n = die_vals
die_vals = seq(1,N)
meanval = 5
probvals = get_probvals(die_vals, meanval)
probvals
barplot(height=probvals, width=1, names.arg=die_vals, ylim=c(0,1))
title(paste("Probabilities of each state, mean val=", meanval, sep=""))

# Flat distribution (equal prob of any descendent size)
N = 6
# n = die_vals
die_vals = seq(1,N)
meanval = 4
probvals = get_probvals(die_vals, meanval)
probvals
barplot(height=probvals, width=1, names.arg=die_vals, ylim=c(0,1))
title(paste("Probabilities of each state, mean val=", meanval, sep=""))

# Flat distribution (equal prob of any descendent size)
N = 6
# n = die_vals
die_vals = seq(1,N)
meanval = 2
probvals = get_probvals(die_vals, meanval)
probvals
barplot(height=probvals, width=1, names.arg=die_vals, ylim=c(0,1))
title(paste("Probabilities of each state, mean val=", meanval, sep=""))

# This produces the LAGRANGE default
# (all smaller descendents are of size 1)
N = 6
# n = die_vals
die_vals = seq(1,N)
meanval = 1.0001
probvals = get_probvals(die_vals, meanval)
probvals
barplot(height=probvals, width=1, names.arg=die_vals, ylim=c(0,1))
title(paste("LAGRANGE 'default', mean val=", meanval, sep=""))

# This is stopped by the error check
# (all smaller descendents are of size 1)
# N = 6
# # n = die_vals
# die_vals = seq(1,N)
# meanval = 0.5
# probvals = get_probvals(die_vals, meanval)
# probvals
# barplot(height=probvals, width=1, names.arg=die_vals, ylim=c(0,1))
# title(paste("Probabilities of each state, mean val=", meanval, sep=""))



