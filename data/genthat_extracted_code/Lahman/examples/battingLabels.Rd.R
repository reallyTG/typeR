library(Lahman)


### Name: battingLabels
### Title: Variable Labels
### Aliases: fieldingLabels pitchingLabels battingLabels
### Keywords: datasets

### ** Examples

data(battingLabels)
str(battingLabels)

require("dplyr")

# find and plot maximum number of homers per year
batHR <- Batting %>%
           filter(!is.na(HR)) %>%
           group_by(yearID) %>%
           summarise(max=max(HR))
		
with(batHR, {
  plot(yearID, max, 
       xlab=Label("yearID"), ylab=paste("Maximum", Label("HR")), 
       cex=0.8)
  lines(lowess(yearID, max), col="blue", lwd=2)
  abline(lm(max ~ yearID), col="red", lwd=2)
	})




