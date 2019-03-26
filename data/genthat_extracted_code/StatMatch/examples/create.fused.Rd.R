library(StatMatch)


### Name: create.fused
### Title: Creates a matched (synthetic) dataset
### Aliases: create.fused
### Keywords: manip

### ** Examples


lab <- c(1:15, 51:65, 101:115)
iris.rec <- iris[lab, c(1:3,5)]  # recipient data.frame
iris.don <- iris[-lab, c(1:2,4:5)] # donor data.frame

# Now iris.rec and iris.don have the variables
# "Sepal.Length", "Sepal.Width"  and "Species"
# in common.
#  "Petal.Length" is available only in iris.rec
#  "Petal.Width"  is available only in iris.don

# find the closest donors using NND hot deck;
# distances are computed on "Sepal.Length" and "Sepal.Width"

out.NND <- NND.hotdeck(data.rec=iris.rec, data.don=iris.don,
            match.vars=c("Sepal.Length", "Sepal.Width"), 
            don.class="Species")

# create synthetic data.set, without the 
# duplication of the matching variables

fused.0 <- create.fused(data.rec=iris.rec, data.don=iris.don, 
            mtc.ids=out.NND$mtc.ids, z.vars="Petal.Width")

# create synthetic data.set, with the "duplication" 
# of the matching variables

fused.1 <- create.fused(data.rec=iris.rec, data.don=iris.don,
            mtc.ids=out.NND$mtc.ids, z.vars="Petal.Width",
            dup.x=TRUE, match.vars=c("Sepal.Length", "Sepal.Width"))



