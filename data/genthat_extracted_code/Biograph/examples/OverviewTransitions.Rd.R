library(Biograph)


### Name: OverviewTransitions
### Title: Overview of transitions
### Aliases: OverviewTransitions

### ** Examples

 data (GLHS)
 z <- Parameters (GLHS)
 seq.ind <- Sequences.ind (GLHS$path,attr(GLHS,"param")$namstates)
 agetrans <- AgeTrans (GLHS)
 overviewT <- OverviewTransitions (GLHS, seq.ind=seq.ind, agetrans)



