library(nbpMatching)


### Name: get.sets
### Title: Get named sets of matches
### Aliases: get.sets get.sets,data.frame-method get.sets,nonbimatch-method

### ** Examples


df <- data.frame(id=LETTERS[1:25], val1=rnorm(25), val2=rnorm(25))
df.dist <- gendistance(df, idcol=1)
df.mdm <- distancematrix(df.dist)
df.match <- nonbimatch(df.mdm)
get.sets(df.match)
get.sets(df.match$matches)
# include the phantom match
get.sets(df.match$matches, FALSE)




