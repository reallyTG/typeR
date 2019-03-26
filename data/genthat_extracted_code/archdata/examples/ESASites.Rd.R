library(archdata)


### Name: ESASites
### Title: Early Stone Age Sites - Norway
### Aliases: ESASites
### Keywords: datasets

### ** Examples

data(ESASites)
NS <- rowSums(ESASites)
NT <- rowSums(ESASites > 0)
plot(NS, NT, xlab="Number of Artifacts", ylab="Number of Types", main="Early Stone Age Sites",
    las=1)



