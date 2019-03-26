library(ABCanalysis)


### Name: ABCanalysis
### Title: Computed ABC analysis: calculates a division of the data in 3
###   classes A, B and C
### Aliases: ABCanalysis
### Keywords: ABC ABCanalysis ABC analysis Lorenz curve Lorenz

### ** Examples

  data("SwissInhabitants")
	abc=ABCanalysis(SwissInhabitants,PlotIt=TRUE)
	A=abc$Aind
	B=abc$Bind
	C=abc$Cind
	Agroup=SwissInhabitants[A]
	Bgroup=SwissInhabitants[B]
	Cgroup=SwissInhabitants[C]




