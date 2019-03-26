library(VGAM)


### Name: V1
### Title: V1 Flying-Bombs Hits in London
### Aliases: V1
### Keywords: datasets

### ** Examples

V1
mean(with(V1, rep(hits, times = ofreq)))
 var(with(V1, rep(hits, times = ofreq)))
 sum(with(V1, rep(hits, times = ofreq)))
## Not run: 
##D  barplot(with(V1, ofreq),
##D           names.arg = as.character(with(V1, hits)),
##D           main = "London V1 buzz bomb hits",
##D           col = "lightblue", las = 1,
##D           ylab = "Frequency", xlab = "Hits") 
## End(Not run)



