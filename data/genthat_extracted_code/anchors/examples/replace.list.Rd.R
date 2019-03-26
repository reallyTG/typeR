library(anchors)


### Name: replace.list
### Title: Updating contents of one list using a second list
### Aliases: replace.list
### Keywords: manip

### ** Examples


  ## replace y, and insert w
  a <- list( x = 1, y = 2, z = 3)
  b <- list( y = 4, w = 5)
  replace.list( a, b)

  ## recursive
  a <- list( x = list( y = 1, z = 2) )
  b <- list( x = list( y = 2, w = 3) )
  replace.list( a, b)

  ## if there is any disagreement between structure of old and new
  ## then structure of new list replaces structure of old list
  a <- list( x = 1, y = list( y=1,z=2))
  b <- list( x = list( y = 2, w = 3) , y = -9)
  replace.list( a, b)




