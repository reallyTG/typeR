library(polmineR)


### Name: chisquare
### Title: Perform chisquare-text.
### Aliases: chisquare chisquare,features-method chisquare,context-method
###   chisquare,cooccurrences-method
### Keywords: textstatistics

### ** Examples

use("polmineR")
library(data.table)
m <- partition(
  "GERMAPARLMINI", speaker = "Merkel", interjection = "speech",
  regex = TRUE, p_attribute = "word"
)
f <- features(m, "GERMAPARLMINI", included = TRUE)
f_min <- subset(f, count_coi >= 5)
summary(f_min)

## Not run: 
##D 
##D # A sample do-it-yourself calculation for chisquare:
##D 
##D # (a) prepare matrix with observed values
##D o <- matrix(data = rep(NA, 4), ncol = 2) 
##D o[1,1] <- as.data.table(m)[word == "Weg"][["count"]]
##D o[1,2] <- count("GERMAPARLMINI", query = "Weg")[["count"]] - o[1,1]
##D o[2,1] <- size(f)[["coi"]] - o[1,1]
##D o[2,2] <- size(f)[["ref"]] - o[1,2]
##D 
##D 
##D # prepare matrix with expected values, calculate margin sums first
##D 
##D r <- rowSums(o)
##D c <- colSums(o)
##D N <- sum(o)
##D 
##D e <- matrix(data = rep(NA, 4), ncol = 2) 
##D e[1,1] <- r[1] * (c[1] / N)
##D e[1,2] <- r[1] * (c[2] / N)
##D e[2,1] <- r[2] * (c[1] / N)
##D e[2,2] <- r[2] * (c[2] / N)
##D 
##D 
##D # compute chisquare statistic
##D 
##D y <- matrix(rep(NA, 4), ncol = 2)
##D for (i in 1:2) for (j in 1:2) y[i,j] <- (o[i,j] - e[i,j])^2 / e[i,j]
##D chisquare_value <- sum(y)
##D 
##D as(f, "data.table")[word == "Weg"][["chisquare"]]
## End(Not run)



