library(polmineR)


### Name: ll
### Title: Compute Log-likelihood Statistics.
### Aliases: ll ll,features-method ll,context-method
###   ll,cooccurrences-method ll,Cooccurrences-method

### ** Examples

# use ll-method explicitly
oil <- cooccurrences("REUTERS", query = "oil", method = NULL)
oil <- ll(oil)
oil_min <- subset(oil, count_coi >= 3)
if (interactive()) View(format(oil_min))
summary(oil)

# use ll-method on 'Cooccurrences'-object
R <- Cooccurrences("REUTERS", left = 5L, right = 5L, p_attribute = "word")
ll(R)
decode(R)
summary(R)

# use log likelihood test for feature extraction
x <- partition(
  "GERMAPARLMINI", speaker = "Merkel",
  interjection = "speech", regex = TRUE,
  p_attribute = "word"
)
f <- features(x, y = "GERMAPARLMINI", included = TRUE, method = "ll")
f <- features(x, y = "GERMAPARLMINI", included = TRUE, method = NULL)
f <- ll(f)
summary(f)

## Not run: 
##D 
##D # A sample do-it-yourself calculation for log-likelihood:
##D # Compute ll-value for query "oil", and "prices"
##D 
##D oil <- context("REUTERS", query = "oil", left = 5, right = 5)
##D 
##D # (a) prepare matrix with observed values
##D o <- matrix(data = rep(NA, 4), ncol = 2) 
##D o[1,1] <- as(oil, "data.table")[word == "prices"][["count_coi"]]
##D o[1,2] <- count("REUTERS", query = "prices")[["count"]] - o[1,1]
##D o[2,1] <- size(oil)[["coi"]] - o[1,1]
##D o[2,2] <- size(oil)[["ref"]] - o[1,2]
##D 
##D 
##D # (b) prepare matrix with expected values, calculate margin sums first
##D r <- rowSums(o)
##D c <- colSums(o)
##D N <- sum(o)
##D 
##D e <- matrix(data = rep(NA, 4), ncol = 2) # matrix with expected values
##D e[1,1] <- r[1] * (c[1] / N)
##D e[1,2] <- r[1] * (c[2] / N)
##D e[2,1] <- r[2] * (c[1] / N)
##D e[2,2] <- r[2] * (c[2] / N)
##D 
##D 
##D # (c) compute log-likelihood value
##D ll_value <- 2 * (
##D   o[1,1] * log(o[1,1] / e[1,1]) +
##D   o[1,2] * log(o[1,2] / e[1,2]) +
##D   o[2,1] * log(o[2,1] / e[2,1]) +
##D   o[2,2] * log(o[2,2] / e[2,2])
##D )
##D 
##D df <- as.data.frame(cooccurrences("REUTERS", query = "oil"))
##D subset(df, word == "prices")[["ll"]]
## End(Not run)



