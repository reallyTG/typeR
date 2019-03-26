library(hyper2)


### Name: euro
### Title: Eurovision Song contest dataset
### Aliases: euro euro2009 eurovision Eurovision Eurovision2009
###   Eurovision_song_contest

### ** Examples

data(euro)

dotchart(maxp(euro2009))

x1 <- loglik(euro2009,indep(maxp  (euro2009)))
x2 <- loglik(euro2009,indep(equalp(euro2009)))

## if the competitors have equal strength, the asymptotic distribution
##   of 2*(x1-x2) is chi-square with 17 degrees of freedom:

pchisq(2*(x1-x2),df=size(euro2009)-1,lower.tail=FALSE)



