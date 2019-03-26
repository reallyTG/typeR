library(mvbutils)


### Name: rbdf
### Title: Data frames: better behaviour with zero-length cases
### Aliases: rbdf rbind rbind.data.frame
### Keywords: misc

### ** Examples

# mvbutils versions are used, unless base:: or baseenv() gets mentioned
# Why base-R dropping of zero rows is odd
rbind( data.frame( x='yes', y=1)[-1,], data.frame( x='no', y=0))$x # mvbutils
#[1] no
#Levels: yes no # two levels
base::rbind( data.frame( x='yes', y=1)[-1,], data.frame( x='no', y=0))$x # base-R
#[1] no
#Levels: no # lost level
rbind( data.frame( x='yes', y=1)[-1,], data.frame( x='no', y=0, stringsAsFactors=FALSE))$x
#[1] no
#Levels: yes no
base::rbind( data.frame( x='yes', y=1)[-1,], data.frame( x='no', y=0, stringsAsFactors=FALSE))$x
#[1] "no" # x has turned into a character
# Quirks of scalar coercion
evalq( rbind( data.frame( x=1), x=2, x=3), baseenv()) # OK I guess
#   x
#1  1
#x  2
#x1 3
evalq( rbind( data.frame( x=1), x=2:3), baseenv()) # NB lost element
#  x
#1 1
#x 2
evalq( rbind( data.frame( x=1, y=2, z=3), c( x=4, y=5)), baseenv())
# NB gained element! Try predicting z[2]...
#  x y z
#1 1 2 3
#2 4 5 4
evalq( rbind( data.frame( x='cat', y='dog'), cbind( x='flea', y='goat')), baseenv()) # OK
#     x    y
#1  cat  dog
#2 flea goat
evalq( rbind( data.frame( x='cat', y='dog'), c( x='flea', y='goat')), baseenv()) # Huh?
#Warning in `[<-.factor`(`*tmp*`, ri, value = "flea") :
#  invalid factor level, NAs generated
#Warning in `[<-.factor`(`*tmp*`, ri, value = "goat") :
#  invalid factor level, NAs generated
#     x    y
#1  cat  dog
#2 <NA> <NA>
evalq( rbind( data.frame( x='cat', y='dog'), c( x='flea')), baseenv()) # Hmmm...
#Warning in `[<-.factor`(`*tmp*`, ri, value = "flea") :
#  invalid factor level, NAs generated
#Warning in `[<-.factor`(`*tmp*`, ri, value = "flea") :
#  invalid factor level, NAs generated
#     x    y
#1  cat  dog
#2 <NA> <NA>
try( evalq( rbind( data.frame( x='cat', y='dog'), cbind( x='flea')), baseenv())) # ...mmmm...
#Error in rbind(deparse.level, ...) :
#  numbers of columns of arguments do not match
# Data frames that aren't:
data.frame( x=1,y=2)[-1,] # a zero-row DF-- OK
# [1] x y
# <0 rows> (or 0-length row.names)
data.frame( x=1)[-1,] # not a DF!?
# numeric(0)
data.frame( x=1)[-1,,drop=FALSE] # OK, but exceeeeeedingly cumbersome
# <0 rows> (or 0-length row.names)
# Implications for rbind:
rbind( data.frame( x='yes')[-1,], x='no')
#  [,1]
# x "no" # rbind.data.frame not called!
rbind( data.frame( x='yes')[-1,,drop=FALSE], x='no')
#Warning in rbind(deparse.level, ...) :
#  risky to supply scalar argument(s) to 'rbind.data.frame'
#   x
#x no
# Quirks of ordering and character/factor conversion:
rbind( data.frame( x=NA), data.frame( x='yes'))$x
#[1] NA    "yes" # character
rbind( data.frame( x=NA_character_), data.frame( x='yes'))$x
#[1] <NA> yes
#Levels: yes # factor!
rbind( data.frame( x='yes'), data.frame( x=NA))$x[2:1]
#[1] <NA>  yes
#Levels: yes # factor again
x1 <- data.frame( x='yes', stringsAsFactors=TRUE)
x2 <- data.frame( x='no', stringsAsFactors=FALSE)
rbind( x1, x2)$x
# [1] yes no
# Levels: yes no
rbind( x2, x1)$x
# [1] "no"  "yes"
# sigh...



