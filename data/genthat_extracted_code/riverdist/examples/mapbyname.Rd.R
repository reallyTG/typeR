library(riverdist)


### Name: mapbyname
### Title: Map Segments by Name
### Aliases: mapbyname

### ** Examples

data(Gulk)
str(Gulk)

Gulk$names <- c("Gulkana River","Trib 1","West Fork","Gulkana River","Trib 1",
                "West Fork","Trib 2","West Fork","Twelvemile Creek","Gulkana River",
                "Middle Fork","Gulkana River","Middle Fork","Hungry Hollow")
str(Gulk)

mapbyname(rivers=Gulk)



