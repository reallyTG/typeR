library(catIrt)


### Name: catIrt
### Title: Simulate Computerized Adaptive Tests (CATs)
### Aliases: catIrt summary.catIrt plot.catIrt print.catIrt

### ** Examples

## Not run: 
##D 
##D #########################
##D # Binary Response Model #
##D #########################
##D set.seed(888)
##D # generating random theta:
##D theta <- rnorm(50)
##D # generating an item bank under a 2-parameter binary response model:
##D b.params <- cbind(a = runif(100, .5, 1.5), b = rnorm(100, 0, 2), c = 0)
##D # simulating responses:
##D b.resp <- simIrt(theta = theta, params = b.params, mod = "brm")$resp
##D 
##D 
##D ## CAT 1 ##
##D # the typical, classic post-hoc CAT:
##D catStart1 <- list(init.theta = 0, n.start = 5,
##D                   select = "UW-FI", at = "theta",
##D                   n.select = 4, it.range = c(-1, 1),
##D                   score = "step", range = c(-1, 1),
##D                   step.size = 3, leave.after.MLE = FALSE)
##D catMiddle1 <- list(select = "UW-FI", at = "theta",
##D                    n.select = 1, it.range = NULL,
##D                    score = "MLE", range = c(-6, 6),
##D                    expos = "none")
##D catTerm1 <- list(term = "fixed", n.min = 10, n.max = 50)
##D 
##D cat1 <- catIrt(params = b.params, mod = "brm",
##D                resp = b.resp,
##D                catStart = catStart1,
##D                catMiddle = catMiddle1,
##D                catTerm = catTerm1)
##D 
##D # we can print, summarize, and plot:
##D cat1                                        # prints theta because
##D                                             # we have fewer than
##D                                             # 200 simulees
##D summary(cat1, group = TRUE, ids = "none")   # nice summary!
##D 
##D summary(cat1, group = FALSE, ids = 1:4)     # summarizing people too! :)
##D 
##D par(mfrow = c(2, 2))
##D plot(cat1, ask = FALSE)               # 2-parameter model, so expected FI
##D                                       # and observed FI are the same
##D par(mfrow = c(1, 1))
##D 
##D # we can also plot particular simulees:
##D par(mfrow = c(2, 1))
##D plot(cat1, which = "none", ids = c(1, 30), ask = FALSE)
##D par(mfrow = c(1, 1))
##D 
##D 
##D ## CAT 2 ##
##D # using Fixed Point KL info rather than Unweighted FI to select items:
##D catStart2 <- catStart1
##D catMiddle2 <- catMiddle1
##D catTerm2 <- catTerm1
##D 
##D catStart2$leave.after.MLE <- TRUE         # leave after mixed response pattern
##D catMiddle2$select <- "FP-KL"
##D catMiddle2$at <- "bounds"
##D catMiddle2$delta <- .2
##D catTerm2$c.term <- list(bounds = 0)
##D cat2 <- catIrt(params = b.params, mod = "brm",
##D                resp = b.resp,
##D                catStart = catStart2,
##D                catMiddle = catMiddle2,
##D                catTerm = catTerm2)
##D cor(cat1$cat_theta, cat2$cat_theta)       # very close!
##D 
##D summary(cat2, group = FALSE, ids = 1:4)   # rarely 5 starting items!
##D 
##D 
##D ## CAT 3/4 ##
##D # using "precision" rather than "fixed" to terminate:
##D catTerm1$term <- catTerm2$term <- "precision"
##D catTerm1$p.term <- catTerm2$p.term <- list(method = "threshold", crit = .3)
##D cat3 <- catIrt(params = b.params, mod = "brm",
##D                resp = b.resp,
##D                catStart = catStart1,
##D                catMiddle = catMiddle1,
##D                catTerm = catTerm1)
##D cat4 <- catIrt(params = b.params, mod = "brm",
##D 			   resp = b.resp,
##D 			   catStart = catStart2,
##D 			   catMiddle = catMiddle2,
##D 			   catTerm = catTerm2)
##D 
##D mean(cat3$cat_length - cat4$cat_length) # KL info results in slightly more items
##D 
##D 
##D ## CAT 5/6 ##
##D # classification CAT with a boundary of 0 (with default classification stuff):
##D catTerm5 <- list(term = "class", n.min = 10, n.max = 50,
##D                  c.term = list(method = "SPRT",
##D                                bounds = 0, delta = .2,
##D                                alpha = .10, beta = .10))
##D cat5 <- catIrt(params = b.params, mod = "brm",
##D                resp = b.resp,
##D                catStart = catStart1,
##D                catMiddle = catMiddle1,
##D                catTerm = catTerm5)
##D cat6 <- catIrt(params = b.params, mod = "brm",
##D                resp = b.resp,
##D                catStart = catStart1,
##D                catMiddle = catMiddle2,
##D                catTerm = catTerm5)
##D 
##D # how many were classified correctly?
##D mean(cat5$cat_categ == cat5$tot_categ)
##D 
##D # using a different selection mechanism, we get the similar results:
##D mean(cat6$cat_categ == cat6$tot_categ)
##D 
##D 
##D ## CAT 7 ##
##D # we could change estimation to EAP with the default (normal) prior:
##D catMiddle7 <- catMiddle1
##D catMiddle7$score <- "EAP"
##D cat7 <- catIrt(params = b.params, mod = "brm", # much slower!
##D                resp = b.resp,
##D                catStart = catStart1,
##D                catMiddle = catMiddle7,
##D                catTerm = catTerm1)
##D cor(cat1$cat_theta, cat7$cat_theta)            # pretty much the same
##D 
##D 
##D ## CAT 8 ##
##D # let's specify the prior as something strange:
##D cat8 <- catIrt(params = b.params, mod = "brm",
##D                resp = b.resp,
##D                catStart = catStart1,
##D                catMiddle = catMiddle7,
##D                catTerm = catTerm1,
##D                ddist = dchisq, df = 4)
##D 
##D cat8   # all positive values of "theta"
##D 
##D 
##D ## CAT 9 ##
##D # finally, we can have:
##D #   - more than one termination criteria,
##D #   - individual bounds per person,
##D #   - simulating based on theta without a response matrix.
##D catTerm9 <- list(term = c("fixed", "class"),
##D                  n.min = 10, n.max = 50,
##D                  c.term = list(method = "SPRT",
##D                                bounds = cbind(runif(length(theta), -1, 0),
##D                                               runif(length(theta), 0, 1)),
##D                                delta = .2,
##D                                alpha = .1, beta = .1))
##D cat9 <- catIrt(params = b.params, mod = "brm",
##D                resp = NULL, theta = theta,
##D                catStart = catStart1,
##D                catMiddle = catMiddle1,
##D                catTerm = catTerm9)
##D 
##D summary(cat9)   # see "... with Each Termination Criterion"
##D 
##D 
##D #########################
##D # Graded Response Model #
##D #########################
##D # generating random theta
##D theta <- rnorm(201)
##D # generating an item bank under a graded response model:
##D g.params <- cbind(a = runif(100, .5, 1.5), b1 = rnorm(100), b2 = rnorm(100),
##D                                            b3 = rnorm(100), b4 = rnorm(100))
##D 
##D # the graded response model is exactly the same, only slower!
##D cat10 <- catIrt(params = g.params, mod = "grm",
##D                 resp = NULL, theta = theta,
##D                 catStart = catStart1,
##D                 catMiddle = catMiddle1,
##D                 catTerm = catTerm1)
##D 
##D # warning because it.range cannot be specified for graded response models!
##D 
##D # if there is more than 200 simulees, it doesn't print individual thetas:
##D cat10
##D 
## End(Not run)

# play around with things - CATs are fun - a little frisky, but fun.



