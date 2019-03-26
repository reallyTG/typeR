library(ecoseries)


### Name: series_sidra
### Title: A function to extract Sidra series using their API
### Aliases: series_sidra
### Keywords: sidra

### ** Examples

sidra=series_sidra(x = c(1612), from = 1990, to = 2015, territory = "brazil")
# sidra=series_sidra(x = c(3653), from = c("200201"), 
# to = c("201512"), territory = "brazil", 
# variable = 3135, sections = c(129316,129330),cl = 544)
# sidra=series_sidra(x = c(3653), from = c("200201"), 
# to = c("201512"), territory = "brazil",  variable = 3135, 
# sections = "all", cl = 544)
# sidra=series_sidra(x = c(1618), from = c("201703"), to = c("201703"), 
# territory = "brazil",
# variable = 109, sections=list(c(39427), c(39437,39441)), cl = c(49, 48))
# trim - x = 1620; from = 199001; to = 201701;  territory = "brazil"; 
# sections=list(c(90687)); cl =c(11255); variable = 583
# sidra = series_sidra(x = 1620, from = 199001, to = 201701,  
# territory = "brazil",
# sections=list(c(90687)), cl =c(11255), variable = 583)



