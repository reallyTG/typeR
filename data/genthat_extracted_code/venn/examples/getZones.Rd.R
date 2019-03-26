library(venn)


### Name: getZones
### Title: Calculate the union(s) of set intersections.
### Aliases: getZones
### Keywords: functions

### ** Examples


venn(3)

area <- getZones("A", snames = "A, B, C")
# a list of length 1

polygon(area[[1]], col="lightblue")


# The very same result is obtained with:
zone <- getZones("1--")



# for 5 sets, the content of the 5th set but not in the first set is a
# list of two zones

venn(5)

zones <- getZones("0---1")
# this time a list of length 2

# (re)coloring the first zone (union)
polygon(zones[[1]], col="lightblue")

# and the second zone (union)
polygon(zones[[2]], col="lightblue")




