library(entropart)


### Name: PPtree
### Title: Preprocessed Trees.
### Aliases: PPtree is.PPtree plot.PPtree

### ** Examples

data(Paracou618)
# Preprocess a phylog object
ppt <- Preprocess.Tree(EightSpTree)
# Is it a preprocessed tree?
is.PPtree(ppt)
# Plot it
plot(ppt, hang=-1)



