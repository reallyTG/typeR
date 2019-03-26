library(Biograph)


### Name: ChangeObservationWindow.e
### Title: Changes observation window to period between two transitions
### Aliases: ChangeObservationWindow.e

### ** Examples

 #  The following example defines observation window 
 # as period between labour force entry and survey date. 
 data(GLHS)
 entrystate <- "J"
 exitstate <- NA
 GLHS2 <- ChangeObservationWindow.e (GLHS,entrystate,exitstate)



