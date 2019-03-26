library(catIrt)


### Name: itChoose
### Title: Choose the Next Item in a CAT
### Aliases: itChoose

### ** Examples

#########################
# Binary Response Model #
#########################
## Not run: 
##D set.seed(888)
##D # generating an item bank under a binary response model:
##D b.params <- cbind(a = runif(100, .5, 1.5), b = rnorm(100, 0, 2), c = .2)
##D # simulating responses using default theta:
##D b.mod <- simIrt(theta = 0, params = b.params, mod = "brm")
##D 
##D # separating the items into "administered" and "not administered":
##D left_par <- b.mod$params[1:95, ]
##D cat_par <- b.mod$params[96:100, ]
##D cat_resp <- b.mod$resp[ , 96:100]
##D 
##D # running simIrt automatically adds the item numbers to the front!
##D 
##D # attempting each item selection algorithm (except random):
##D uwfi.it <- itChoose(left_par = left_par, mod = "brm",
##D                     numb = 1, n.select = 1,
##D                     cat_theta = 0,
##D                     select = "UW-FI",
##D                     at = "theta")
##D lwfi.it <- itChoose(left_par = left_par, mod = "brm",
##D                     numb = 1, n.select = 1,
##D                     cat_par = cat_par, cat_resp = cat_resp,
##D                     select = "LW-FI")
##D pwfi.it <- itChoose(left_par = left_par, mod = "brm",
##D                     numb = 1, n.select = 1,
##D                     cat_par = cat_par, cat_resp = cat_resp,
##D                     select = "PW-FI", ddist = dnorm, mean = 0, sd = 1)
##D 
##D fpkl.it <- itChoose(left_par = left_par, mod = "brm",
##D                     numb = 1, n.select = 1,
##D                     cat_theta = 0,
##D                     select = "FP-KL",
##D                     at = "theta", delta = 1.96)
##D vpkl.it <- itChoose(left_par = left_par, mod = "brm",
##D                     numb = 1, n.select = 1,
##D                     cat_par = cat_par, cat_theta = 0,
##D                     select = "VP-KL",
##D                     at = "theta", delta = 1.96)
##D fikl.it <- itChoose(left_par = left_par, mod = "brm",
##D                     numb = 1, n.select = 1,
##D                     cat_theta = 0,
##D                     select = "FI-KL",
##D                     at = "theta", delta = 1.96)
##D vikl.it <- itChoose(left_par = left_par, mod = "brm",
##D                     numb = 1, n.select = 1,
##D                     cat_par = cat_par, cat_theta = 0,
##D                     select = "VI-KL",
##D                     at = "theta", delta = 1.96)
##D 
##D # which items were the most popular?
##D uwfi.it$params  # 61 (b close to 0)
##D lwfi.it$params  # 55 (b close to -2.5)
##D pwfi.it$params  # 16 (b close to -0.5)
##D fpkl.it$params  # 61 (b close to 0)
##D vpkl.it$params  # 61 (b close to 0)
##D fikl.it$params  # 16 (b close to -0.5)
##D vikl.it$params  # 16 (b close to -0.5)
##D 
##D # if we pick the top 10 items for "FI-KL":
##D fikl.it2 <- itChoose(left_par = left_par, mod = "brm",
##D                      numb = 10, n.select = 10,
##D                      cat_theta = 0,
##D                      select = "FI-KL",
##D                      at = "theta", delta = 1.96)
##D 
##D # we find that item 61 is the third best item
##D fikl.it2$params
##D 
##D # why did "LW-FI" pick an item with a strange difficulty?
##D cat_resp
##D 
##D # because cat_resp is mostly 0 ...
##D # --> so the likelihood is weighted toward negative numbers.
##D 
##D #########################
##D # Graded Response Model #
##D #########################
##D set.seed(999)
##D # generating an item bank under a graded response model:
##D g.params <- cbind(runif(100, .5, 1.5), rnorm(100), rnorm(100),
##D                                        rnorm(100), rnorm(100), rnorm(100))
##D # simulating responses (so that the parameters are ordered - see simIrt)
##D left_par <- simIrt(theta = 0, params = g.params, mod = "grm")$params
##D 
##D # now we can choose the best item for theta = 0 according to FI:
##D uwfi.it2 <- itChoose(left_par = left_par, mod = "brm",
##D                      numb = 1, n.select = 1,
##D                      cat_theta = 0,
##D                      select = "UW-FI",
##D                      at = "theta")
##D uwfi.it2
## End(Not run)




