library(nutshell.audioscrobbler)


### Name: audioscrobbler
### Title: Audioscrobbler User Data
### Aliases: audioscrobbler
### Keywords: datasets

### ** Examples

library(arules)
data(audioscrobbler)
audioscrobbler.apriori <- apriori(
     data=audioscrobbler,
     parameter=new("APparameter",support=0.0645)
   )
inspect(audioscrobbler.apriori)



