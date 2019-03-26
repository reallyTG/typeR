library(isopam)


### Name: isotab
### Title: Ordered frequency table for Isopam clusters
### Aliases: isotab

### ** Examples

   ## load data to the current environment
   data(andechs)
     
   ## call isopam with the standard options
   ip<-isopam(andechs)
    
   ## build table (uppermost hierarchy level)
   isotab(ip)

   ## build table (lower hierarchy level)
   isotab(ip,2)



