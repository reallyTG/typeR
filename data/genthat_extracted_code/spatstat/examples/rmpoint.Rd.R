library(spatstat)


### Name: rmpoint
### Title: Generate N Random Multitype Points
### Aliases: rmpoint
### Keywords: spatial datagen

### ** Examples


abc <- c("a","b","c")

##### Model I

rmpoint(25, types=abc)
rmpoint(25, 1, types=abc)
# 25 points, equal probability for each type, uniformly distributed locations

rmpoint(25, function(x,y,m) {rep(1, length(x))}, types=abc)
# same as above
rmpoint(25, list(function(x,y){rep(1, length(x))},
                 function(x,y){rep(1, length(x))},
                 function(x,y){rep(1, length(x))}),
             types=abc)
# same as above

rmpoint(25, function(x,y,m) { x }, types=abc)
# 25 points, equal probability for each type,
# locations nonuniform with density proportional to x

rmpoint(25, function(x,y,m) { ifelse(m == "a", 1, x) }, types=abc)
rmpoint(25, list(function(x,y) { rep(1, length(x)) },
                function(x,y) { x },
                function(x,y) { x }),
                types=abc)
# 25 points, UNEQUAL probabilities for each type,
# type "a" points uniformly distributed,
# type "b" and "c" points nonuniformly distributed.

##### Model II

rmpoint(25, 1, types=abc, ptypes=rep(1,3)/3)
rmpoint(25, 1, types=abc, ptypes=rep(1,3))
# 25 points, equal probability for each type,
# uniformly distributed locations

rmpoint(25, function(x,y,m) {rep(1, length(x))}, types=abc, ptypes=rep(1,3))
# same as above
rmpoint(25, list(function(x,y){rep(1, length(x))},
                 function(x,y){rep(1, length(x))},
                 function(x,y){rep(1, length(x))}),
             types=abc, ptypes=rep(1,3))
# same as above

rmpoint(25, function(x,y,m) { x }, types=abc, ptypes=rep(1,3))
# 25 points, equal probability for each type,
# locations nonuniform with density proportional to x

rmpoint(25, function(x,y,m) { ifelse(m == "a", 1, x) }, types=abc, ptypes=rep(1,3))
# 25 points, EQUAL probabilities for each type,
# type "a" points uniformly distributed,
# type "b" and "c" points nonuniformly distributed.

###### Model III

rmpoint(c(12, 8, 4), 1, types=abc)
# 12 points of type "a",
# 8 points of type "b",
# 4 points of type "c",
# each uniformly distributed

rmpoint(c(12, 8, 4), function(x,y,m) { ifelse(m=="a", 1, x)}, types=abc)
rmpoint(c(12, 8, 4), list(function(x,y) { rep(1, length(x)) },
                               function(x,y) { x },
                               function(x,y) { x }),
             types=abc)

# 12 points of type "a", uniformly distributed
# 8 points of type "b", nonuniform
# 4 points of type "c", nonuniform


#########

## Randomising an existing point pattern:
# same numbers of points of each type, uniform random locations (Model III)
rmpoint(table(marks(demopat)), 1, win=Window(demopat))

# same total number of points, distribution of types estimated from X,
# uniform random locations (Model II)
rmpoint(npoints(demopat), 1, types=levels(marks(demopat)), win=Window(demopat),
       ptypes=table(marks(demopat)))




