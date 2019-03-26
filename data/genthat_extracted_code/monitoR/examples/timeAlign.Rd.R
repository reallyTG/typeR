library(monitoR)


### Name: timeAlign
### Title: Condense Detections or Peaks from Multiple Templates
### Aliases: timeAlign
### Keywords: manip

### ** Examples

## Not run: 
##D # Not run because it will create files in user's working directory
##D data(survey)
##D data(btnw)
##D 
##D writeWave(btnw, "btnw.wav")
##D 
##D btnw2 <- cutw(survey, from = 0.75, to = 3)
##D 
##D writeWave(btnw2, "btnw2.wav")
##D 
##D # Template construction
##D btnw1 <- makeBinTemplate(
##D         "btnw.wav", 
##D         frq.lim = c(2, 8), 
##D         select = "auto", 
##D         name = "btnw1", 
##D         buffer = 4, 
##D         amp.cutoff = -31, 
##D         binary = TRUE)
##D 
##D btnw2 <- makeBinTemplate(
##D         "btnw2.wav", 
##D         frq.lim = c(2, 8), 
##D         select = "auto", 
##D         name = "btnw2", 
##D         buffer = 4, 
##D         amp.cutoff = -24, 
##D         binary = TRUE)
##D 
##D # Join templates
##D btnw <- combineBinTemplates(btnw1, btnw2)
##D 
##D # Binary point matching
##D scores <- binMatch(survey = survey, templates = btnw, time.source = 'fileinfo')
##D 
##D # Isolate peaks
##D pks <- findPeaks(scores)
##D 
##D # View detections
##D getDetections(pks)
##D 
##D # Compare to output of timeAlign
##D timeAlign(pks)
## End(Not run)



