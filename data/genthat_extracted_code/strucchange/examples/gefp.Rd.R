library(strucchange)


### Name: gefp
### Title: Generalized Empirical M-Fluctuation Processes
### Aliases: gefp print.gefp sctest.gefp plot.gefp time.gefp print.gefp
### Keywords: regression

### ** Examples

data("BostonHomicide")
gcus <- gefp(homicides ~ 1, family = poisson, vcov = kernHAC,
	     data = BostonHomicide)
plot(gcus, aggregate = FALSE)	 
gcus
sctest(gcus)



