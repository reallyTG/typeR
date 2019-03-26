library(ABCanalysis)


### Name: calculatedABCanalysis
### Title: Computed ABC analysis: calculates a division of the data in 3
###   classes A, B and C
### Aliases: calculatedABCanalysis
### Keywords: ABC ABCanalysis ABC analysis Lorenz curve Computed ABC
###   analysis Lorenz

### ** Examples

  data("SwissInhabitants")
	abc=calculatedABCanalysis(SwissInhabitants)
	A=abc$Aind
	B=abc$Bind
	C=abc$Cind
	Agroup=SwissInhabitants[A]
	Bgroup=SwissInhabitants[B]
	Cgroup=SwissInhabitants[C]




