library(UsingR)


### Name: u2
### Title: Song and lengths for U2 albums
### Aliases: u2
### Keywords: datasets

### ** Examples

data(u2)
sapply(u2,mean)			# average track length
max(sapply(u2,max))		# longest track length
sort(unlist(u2))		# lengths in sorted order



