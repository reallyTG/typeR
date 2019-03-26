library(geophys)


### Name: PPoints
### Title: Igneous Petrology Points
### Aliases: PPoints
### Keywords: datasets

### ** Examples


data(Glines)
data(PPoints)

plot(Glines[[1]], type='n', xlab="SiO2", ylab="NA2O+K2O")
for(i in 1:length(Glines))
{

lines(Glines[[i]]$x, Glines[[i]]$y)

}

for(i in 1:length(PPoints$x))
{
text(PPoints$x[i],PPoints$y[i], label=PPoints$lab[i], srt=PPoints$rots[i])
}




