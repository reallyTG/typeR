library(StatDA)


### Name: CorGroups
### Title: Correlation Matrix for Sub-groups
### Aliases: CorGroups
### Keywords: multivariate

### ** Examples

data(chorizon)
x=chorizon[,c("Ca","Cu","Mg","Na","P","Sr","Zn")]

#definition of the groups
lit=chorizon[,"LITO"]
litolog=rep(NA, length(lit))
litolog[lit==10] <- 1
litolog[lit==52] <- 2
litolog[lit==81 | lit==82 | lit==83] <- 3
litolog[lit==7] <- 4
litolog <- litolog[!is.na(litolog)]
litolog <- factor(litolog, labels=c("AB","PG","AR","LPS"))

par(mfrow=c(1,1),mar=c(0.1,0.1,0.1,0.1))
CorGroups(log10(x), grouping=litolog, labels1=dimnames(x)[[2]],labels2=dimnames(x)[[2]],
legend=c("Caledonian Sediments","Basalts","Alkaline Rocks","Granites"),ndigits=2)




