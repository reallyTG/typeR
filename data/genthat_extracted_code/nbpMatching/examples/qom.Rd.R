library(nbpMatching)


### Name: qom
### Title: Quality of Match
### Aliases: qom qom,data.frame,data.frame-method
###   qom,data.frame,nonbimatch-method

### ** Examples


df <- data.frame(id=LETTERS[1:25], val1=rnorm(25), val2=rnorm(25))
df.dist <- gendistance(df, idcol=1)
df.mdm <- distancematrix(df.dist)
df.match <- nonbimatch(df.mdm)
qom(df.dist$cov, df.match)
qom(df.dist$cov, df.match$matches)




