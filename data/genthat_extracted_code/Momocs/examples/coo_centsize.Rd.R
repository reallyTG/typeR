library(Momocs)


### Name: coo_centsize
### Title: Calculates centroid size
### Aliases: coo_centsize

### ** Examples

coo_centsize(bot[1])
# on a Coo
coo_centsize(bot)
# add it to $fac
mutate(bot, size=coo_centsize(bot))



