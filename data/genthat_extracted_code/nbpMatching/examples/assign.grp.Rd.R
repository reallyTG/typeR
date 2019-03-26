library(nbpMatching)


### Name: assign.grp
### Title: Random Group Assignment
### Aliases: assign.grp assign.grp,data.frame-method
###   assign.grp,nonbimatch-method

### ** Examples


df <- data.frame(id=LETTERS[1:25], val1=rnorm(25), val2=rnorm(25))
df.dist <- gendistance(df, idcol=1)
df.mdm <- distancematrix(df.dist)
df.match <- nonbimatch(df.mdm)
assign.grp(df.match)
assign.grp(df.match$matches)




