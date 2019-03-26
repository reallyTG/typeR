library(nat)


### Name: as.data.frame.neuronlist
### Title: Get or set the attached data.frame of a neuronlist
### Aliases: as.data.frame.neuronlist data.frame<- data.frame<-.neuronlist

### ** Examples

head(as.data.frame(kcs20))

# add additional variables
str(as.data.frame(kcs20, i=seq(kcs20), abc=LETTERS[seq(kcs20)]))
# stop character columns being turned into factors
newdf <- as.data.frame(kcs20, i=seq(kcs20), abc=LETTERS[seq(kcs20)], 
  stringsAsFactors=FALSE)
str(newdf)
data.frame(kcs20)=newdf



