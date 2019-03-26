library(cgam)


### Name: Ord
### Title: Specify an Ordered Categorical Family in a CGAM Formula
### Aliases: Ord
### Keywords: ordered categorical family

### ** Examples

## Not run: 
##D 	# Example 1. 
##D 	# generate the predictor and the latenet variable
##D 	n <- 500
##D 	set.seed(123)
##D 	x <- runif(n, 0, 1)
##D 	yst <- 5*x^2 + rlogis(n)
##D 	
##D 	# generate observed ordered response, which has levels 1, 2, 3. 
##D 	cts <- quantile(yst, probs = seq(0, 1, length = 4)) 
##D 	yord <- cut(yst, breaks = cts, include.lowest = TRUE, labels = c(1:3), Ord = TRUE)
##D 	y <- as.numeric(levels(yord))[yord] 
##D 
##D 	# regress y on x under the shape-restriction: the latent variable is "increasing-convex"
##D 	# w.r.t x
##D 	ans <- cgam(y ~ s.incr.conv(x), family = Ord)
##D 	
##D 	# check the estimated cut-points
##D 	ans$zeta
##D 	
##D 	# check the estimated expected value of the latent variable
##D 	head(ans$muhat)
##D 	
##D 	# check the estimated probabilities P(y = k), k = 1, 2, 3
##D 	head(fitted(ans))
##D 	
##D 	# check the estimated latent variable
##D 	plot(x, yst, cex = 1, type = "n", ylab = "latent variable")
##D 	cols <- topo.colors(3)
##D 	for (i in 1:3) {
##D 		points(x[y == i], yst[y == i], col = cols[i], pch = i, cex = 0.7)
##D 	}
##D 	for (i in 1:2) {
##D 		abline(h = (ans$zeta)[i], lty = 4, lwd = 1)
##D 	}
##D 	lines(sort(x), (5*x^2)[order(x)], lwd = 2)
##D 	lines(sort(x), (ans$muhat)[order(x)], col = 2, lty = 2, lwd = 2)
##D 	legend("topleft", bty = "n", col = c(1, 2), lty = c(1, 2), 
##D 	c("true latent variable", "increasing-convex fit"), lwd = c(1, 1))
## End(Not run)	
## Not run: 
##D 	# Example 2. mental impairment data set 
##D 	# mental impairment is an ordinal response with 4 categories recorded as 1, 2, 3, and 4
##D 	# two covariates are life event index and socio-economic status (high = 1, low = 0)
##D 	data(mental)
##D 	table(mental$mental)
##D 	
##D 	# model the relationship between the latent variable and life event index as increasing
##D 	# socio-economic status is included as a binary covariate 
##D 	fit.incr <- cgam(mental ~ incr(life) + ses, data = mental, family = Ord)
##D 
##D 	# check the estimated probabilities P(mental = k), k = 1, 2, 3, 4
##D 	probs.incr <- fitted(fit.incr)
##D 	head(probs.incr)
## End(Not run)




