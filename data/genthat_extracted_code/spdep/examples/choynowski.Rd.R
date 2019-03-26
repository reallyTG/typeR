library(spdep)


### Name: choynowski
### Title: Choynowski probability map values
### Aliases: choynowski
### Keywords: spatial

### ** Examples

if (require(rgdal, quietly=TRUE)) {
example(auckland, package="spData")
res <- choynowski(auckland$M77_85, 9*auckland$Und5_81)
resl <- choynowski(auckland$M77_85, 9*auckland$Und5_81, legacy=TRUE)
all.equal(res, resl)
rt <- sum(auckland$M77_85)/sum(9*auckland$Und5_81)
ch_ppois_pmap <- numeric(length(auckland$Und5_81))
side <- c("greater", "less")
for (i in seq(along=ch_ppois_pmap)) {
  ch_ppois_pmap[i] <- poisson.test(auckland$M77_85[i], r=rt,
    T=(9*auckland$Und5_81[i]), alternative=side[(res$type[i]+1)])$p.value
}
all.equal(ch_ppois_pmap, res$pmap)

res1 <- probmap(auckland$M77_85, 9*auckland$Und5_81)
table(abs(res$pmap - res1$pmap) < 0.00001, res$type)
lt005 <- (res$pmap < 0.05) & (res$type)
ge005 <- (res$pmap < 0.05) & (!res$type)
cols <- rep("white", length(lt005))
cols[lt005] <- grey(2/7)
cols[ge005] <- grey(5/7)
plot(auckland, col=cols) 
legend("bottomleft", fill=grey(c(2,5)/7), legend=c("low", "high"), bty="n")
}



