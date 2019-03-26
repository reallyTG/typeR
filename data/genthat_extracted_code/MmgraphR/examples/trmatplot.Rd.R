library(MmgraphR)


### Name: trmatplot
### Title: Transition Matrix Plot
### Aliases: trmatplot trmatplot.default trmatplot.array
###   trmatplot.depmix.fitted trmatplot.dthmm trmatplot.hmm trmatplot.msm

### ** Examples

##########################################
# Plotting a probability transition matrix
##########################################

trMat<-matrix(c(0.1, 0.05, 0.05, 0.80,
  0.06, 0.02, 0.03, 0.89,
  0.03, 0.01, 0.01, 0.95,
  0, 0, 0, 1), nrow = 4, ncol = 4, byrow = TRUE)

trmatplot(trMat)

#--- Setting a seed so that the graphic can be replicated

trmatplot(trMat, seed = 2)

#--- Adjusting line width

trmatplot(trMat, seed = 2, lwd = 0.8)

#--- Defining a second order probability transition matrix as an array

trMatArray <- array(c(
  0.30, 0.70,
  0.65, 0.35, 
  0.05, 0.95,
  0.99, 0.01), dim = c(1, 2, 4))

#--- Plotting with user-defined colors

trmatplot(trMatArray, seed = 3, morder = 2, cpal = c("grey40", "grey70"))

###########################################################
# cspal: ready-to-use color palettes using colorspace
###########################################################

#--- Color palette "dynamic"

trmatplot(trMat, seed = 2, cspal = "dynamic")

#--- Color palette "harmonic"

trmatplot(trMat, seed = 2, cspal = "harmonic")

#--- Color palette "cold"

trmatplot(trMat, seed = 2, cspal = "cold")

#--- Color palette "warm"

trmatplot(trMat, seed = 2, cspal = "warm")

#--- Color palette "heat"

trmatplot(trMat, seed = 2, cspal = "heat")

#--- Color palette "terrain"

trmatplot(trMat, seed = 2, cspal = "terrain")

###########################################################
# pfilter: Filtering out most (or least) probable sequences
###########################################################

#--- The most probable sequence given a state

trmatplot(trMat, seed = 2, pfilter = "smax")

#--- The least probable sequence given a state

trmatplot(trMat, seed = 2, pfilter = "smin")

#--- The two most probable sequnces

trmatplot(trMat, seed = 2, pfilter = "tmax", num = 2 )

#--- The ten least probable sequences

trmatplot(trMat, seed = 2, pfilter = "tmin", num = 10 )

######################################################
# filter: Highlighting a specific sequence of interest
######################################################

#--- Highlight the probability that a sequence is initially in state 1 and then in state 4

trmatplot(trMat, seed = 2, filter = list(type = "sequence", value = "(1)-(4)"))



