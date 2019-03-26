library(fastR2)


### Name: Fumbles
### Title: NCAA football fumbles
### Aliases: Fumbles
### Keywords: datasets

### ** Examples


data(Fumbles)
m <- max(Fumbles$week1)
table(factor(Fumbles$week1,levels = 0:m))
favstats( ~ week1, data = Fumbles)
# compare with Poisson distribution
cbind(
		  fumbles = 0:m,
		  observedCount = table(factor(Fumbles$week1,levels = 0:m)),
		  modelCount= 120* dpois(0:m,mean(Fumbles$week1)),
		  observedPct = table(factor(Fumbles$week1,levels = 0:m))/120,
		  modelPct= dpois(0:m,mean(Fumbles$week1))
	) %>% signif(3)
showFumbles <- function(x, lambda = mean(x),...) {
  result <-
    gf_dhistogram( ~ week1, data = Fumbles, binwidth = 1, alpha = 0.3) %>%
    gf_dist("pois", lambda = mean( ~ week1, data = Fumbles) )
  print(result)
  return(result)
}
showFumbles(Fumbles$week1)
showFumbles(Fumbles$week2)
showFumbles(Fumbles$week3)




