library(Biograph)


### Name: RateTable
### Title: Table for rate calculation
### Aliases: RateTable Ratetable
### Keywords: Transitions Exposure

### ** Examples

 data (GLHS)
 z<- Parameters (GLHS)
 occup <- Occup(GLHS)
 ist <- Sequences.ind (GLHS$path,attr(GLHS,"param")$namstates)
 trans <- Trans (GLHS)
 w <- RateTable(GLHS,occup, trans)



