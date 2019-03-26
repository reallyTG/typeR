library(fishmove)


### Name: fishmove.query
### Title: Prediction of Probabilities of Fish Movement/Occurrence based on
###   Leptokurtic Dispersal Kernels
### Aliases: fishmove.query

### ** Examples

	# Prediction for a selected fish species
	fm <- fishmove(L=100, AR=1.5, T=365, rep=20)
  
  # Query using fishmove.query
  
  # at which distance is the cumulative probability (area under kernel) of a 50 m reach 0.06
  # fishmove.query(fm,prob=0.06,reachlength=50)
  # what is the probability of occurence in a reach between 0 and 50 m from the source population
  fishmove.query(fm,from=0,to=50)





