library(Epi)


### Name: plotCIF
### Title: Plotting Aalen-Johansen curves for competing events
### Aliases: plotCIF stackedCIF

### ** Examples

library(survival)   #  requires version 2.39-4 or later
head(mgus1)
#  Aalen-Johansen estimates of CIF are plotted by sex for two 
#  competing events: (1) progression (pcm), and (2) death, in 
#  a cohort of patients with monoclonal gammopathy.

#  The data are actually covering transitions from pcm to death, too,
#  for those entering the state of pcm. Such patients have two rows
#  in the data frame, and in their 2nd row the 'start' time is 
#  the time to pcm (in days). 

#  In our analysis we shall only include those time intervals with value 0
#  for variable 'start'. Thus, the relevant follow-up time is represented 
#  by variable 'stop' (days). For convenience, days are converted to years.

fitCI <- survfit(Surv(stop/365.25, event, type="mstate") ~ sex,
              data= subset(mgus1, start==0) )
par(mfrow=c(1,2))
plotCIF(fitCI, event = 1, col = c("red", "blue"),
  main = "Progression", xlab="Time (years)" )
text( 38, 0.15, "Men", pos = 2)
text( 38, 0.4, "Women", pos = 2)
plotCIF(fitCI, event = 2, col = c("red", "blue"), 
  main = "Death", xlab="Time (years)" )
text( 38, 0.8, "Men", pos = 2)
text( 38, 0.5, "Women", pos = 2)

par(mfrow=c(1,2))
stackedCIF(fitCI, group = 1, colour = c("gray80", "gray90"),
  main = "Women", xlab="Time (years)" )	
text( 36, 0.15, "PCM", pos = 2)
text( 36, 0.6, "Death", pos = 2)
stackedCIF(fitCI, group = 2, colour = c("gray80", "gray90"), 
  main = "Men", xlab="Time (years)" )
text( 39, 0.10, "PCM", pos = 2)
text( 39, 0.6, "Death", pos = 2)	



