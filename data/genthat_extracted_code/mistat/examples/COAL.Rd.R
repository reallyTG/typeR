library(mistat)


### Name: COAL
### Title: Number of Coal Mine Disasters
### Aliases: COAL
### Keywords: datasets

### ** Examples

data(COAL)
Bp <- barplot(COAL)                  
                                     
axis(side=1,                         
     labels=seq(
       from=1850, 
       to=1960, 
       by=10),  
     at=Bp[rep(c(TRUE,               
                 rep(FALSE, 9)),     
               10)])                 
                                     
rm(Bp)



