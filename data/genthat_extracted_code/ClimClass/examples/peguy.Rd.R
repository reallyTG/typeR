library(ClimClass)


### Name: peguy
### Title: Peguy Climograph
### Aliases: peguy

### ** Examples


library(stringr)
data(Trent_climate)


TrentinoClimateDf <- do.call(rbind,clima_81_10)
names <- rownames(TrentinoClimateDf)
TrentinoClimateDf$station <- unlist(lapply(X=str_split(names,pattern="[.]"),FUN=function(x) {x[1]}))
 


data <- TrentinoClimateDf[TrentinoClimateDf$station %in% unique(TrentinoClimateDf$station)[1:3],]
p <- peguy(data=data)





