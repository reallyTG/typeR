library(prettyR)


### Name: delim.xtab
### Title: Format a crosstabulation
### Aliases: delim.xtab
### Keywords: misc

### ** Examples

 alpha1<-sample(LETTERS[1:3],50,TRUE)
 alpha2<-sample(LETTERS[1:2],50,TRUE)
 alphas<-data.frame(alpha1,alpha2)
 alphatab<-xtab(alpha1~alpha2,alphas)
 delim.xtab(alphatab,pct="row",interdigitate=TRUE)
 delim.xtab(alphatab,pct="column",interdigitate=TRUE)
 delim.xtab(alphatab,pct="cell",interdigitate=TRUE)



