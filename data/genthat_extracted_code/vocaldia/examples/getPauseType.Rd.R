library(vocaldia)


### Name: getPauseType
### Title: getPauseType: name pause type between two vocalisation events.
### Aliases: getPauseType

### ** Examples

getPauseType('a', 'b')
 ## [1]  "SwitchingPause"
getPauseType('a', 'Grp')
 ## [1]  "SwitchingPause"
getPauseType('Grp', 'Grp')
 ## [1]  "GrpPause"
getPauseType('Grp', 'a')
 ## [1]  "GrpSwitchingPause"
getPauseType('a', 'a')
 ##[1] "Pause"



