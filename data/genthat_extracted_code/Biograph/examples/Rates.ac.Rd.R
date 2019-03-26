library(Biograph)


### Name: Rates.ac
### Title: Estimates occurrence-exposure rates
### Aliases: Rates.ac

### ** Examples

#   Example 1: Transition rates between NOJOB and JOB, based on GLHS
   data(GLHS)
   z<- Parameters (GLHS)
   occup <- Occup(GLHS)
   seq.ind <- Sequences.ind (GLHS$path,attr(GLHS,"param")$namstates)
   trans <- Trans (GLHS)
   ratetable <- RateTable (GLHS,occup=occup,trans=trans)
   rates <- Rates.ac (Stable=ratetable$Stable)

#   Example 2: Rates of transition between living arrangements, based on NLOG98
   data(NLOG98)
   data <- NLOG98[!is.na (NLOG98$kerk)&NLOG98$kerk=="Roman Catholic",]
   z <- Parameters (data)
   seq.ind <- Sequences.ind (data$path,namstatesnew=c("H","C","A","M","K"))
   occup <- Occup (data)
   trans <- Trans (Bdata=data)
   ratetable <- RateTable (NLOG98,occup=occup,trans=trans)
   rates <- Rates.ac (Stable=ratetable$Stable)   
   



