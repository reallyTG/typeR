library(synthpop)


### Name: numtocat.syn
### Title: Group numeric variables before synthesis
### Aliases: numtocat.syn

### ** Examples

SD2011.cat <- numtocat.syn(SD2011, cont.na = list(income = -8 , unempdur = -8, 
nofriend = -8))
summary(SD2011.cat$data)



