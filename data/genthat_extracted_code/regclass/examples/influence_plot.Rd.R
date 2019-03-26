library(regclass)


### Name: influence_plot
### Title: Influence plot for regression diganostics
### Aliases: influence_plot influence.plot

### ** Examples

  data(TIPS)
  M <- lm(TipPercentage~.-Tip,data=TIPS)
	influence_plot(M)

	
	 


