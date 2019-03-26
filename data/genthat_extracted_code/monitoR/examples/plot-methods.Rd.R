library(monitoR)


### Name: plot-methods
### Title: Methods for the 'plot' Function
### Aliases: plot-methods plot,TemplateList,ANY-method
###   plot,detectionList,ANY-method
### Keywords: methods hplot

### ** Examples

## Not run: 
##D # Not run because of the time required (maybe 5-10 seconds)
##D # Also some plot calls require user input by default
##D # Load data
##D data(btnw)
##D data(survey)
##D 
##D # Write Wave objects to file (temporary directory used here)
##D btnw.fp <- file.path(tempdir(), "btnw.wav")
##D oven.fp <- file.path(tempdir(), "oven.wav")
##D survey.fp <- file.path(tempdir(), "survey2010-12-31_120000_EST.wav")
##D writeWave(btnw, btnw.fp)
##D writeWave(survey, survey.fp)
##D 
##D # Create a template list
##D ctemp1 <- makeCorTemplate(btnw.fp, name = "w1")
##D ctemp2 <- makeCorTemplate(btnw.fp, t.lim = c(0.5, 2.5), frq.lim = c(1, 10), dens = 0.1, name = "w2")
##D ctemps <- combineCorTemplates(ctemp1, ctemp2)
##D 
##D # Then it can be plotted like this
##D plot(ctemps)
##D 
##D # Next call is not useful for template w1 but good for w2:
##D plot(ctemps, pt.col = "red")
##D 
##D # Can plot just one template
##D plot(ctemps, which.one = 2, pt.col = "red")
##D plot(ctemps, which.one = "w2", pt.col = "red")
##D 
##D # And to check values
##D plot(ctemps, which.one = 1, click = TRUE)
##D 
##D # To plot detections, let's create some
##D cscores <- corMatch(survey.fp, ctemps)
##D cdetects <- findPeaks(cscores)
##D 
##D # And to plot them:
##D plot(cdetects)
##D 
##D # Clean up (only because these files were created in these examples)
##D file.remove(btnw.fp)
##D file.remove(survey.fp)
## End(Not run)



