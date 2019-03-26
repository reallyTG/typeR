library(untb)


### Name: rand.neutral
### Title: Random neutral ecosystem
### Aliases: rand.neutral
### Keywords: math

### ** Examples

rand.neutral(1000, 9)
rand.neutral(1000, 9, string="spp.")

data(butterflies)
rand.neutral(no.of.ind(butterflies), optimal.theta(butterflies),string="spp.")


# what is the distribution of abundance of the second ranked species if
# J=10, theta=0.7?
plot(table(replicate(100,rand.neutral(10,theta=0.7,pad=TRUE)[2])))




