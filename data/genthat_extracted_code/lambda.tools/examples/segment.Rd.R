library(lambda.tools)


### Name: segment
### Title: Segment a sequence into shifted versions of itself
### Aliases: segment

### ** Examples

segment(1:10)

# Notice how the ends of the sequence are given their own rows
segment(1:10, TRUE)

# Emulate segment using partition
partition(1:10, function(x) x, 1)

# Emulate segment using maprange
t(maprange(1:10, 2, function(x) x))

# Create four shifted copies instead of two
maprange(1:10, 4, function(x) x)



