library(umx)


### Name: umxPath
### Title: Easier (and powerful) specification of paths in SEM.
### Aliases: umxPath

### ** Examples

# A worked example
data(demoOneFactor)
latents  = c("G")
manifests = names(demoOneFactor)
myData = mxData(cov(demoOneFactor), type = "cov", numObs = 500)
m1 <- umxRAM("One Factor", data = myData,
	umxPath(latents, to = manifests),
	umxPath(var = manifests),
	umxPath(var = latents, fixedAt = 1.0)
)
umxSummary(m1, show = "std")
require(umx)
#
# Examples of each path type, and option
umxPath("A", to = "B") # One-headed path from A to B
umxPath("A", to = "B", fixedAt = 1) # same, with value fixed @1
umxPath("A", to = c("B", "C"), fixedAt = 1:2) # same, with more than 1 value
umxPath("A", to = LETTERS[2:4], firstAt = 1) # Fix only the first path, others free
umxPath(var = "A") # Give a variance to A
umxPath(var = "A", fixedAt = 1) # Give a variance, fixed at 1
umxPath(var = LETTERS[1:5], fixedAt = 1)
umxPath(means = c("A","B")) # Create a means model for A: from = "one", to = "A"
umxPath(v1m0 = "A") # Give "A" variance and a mean, fixed at 1 and 0 respectively
umxPath(v.m. = "A") # Give "A" variance and a mean, leaving both free.
umxPath("A", with = "B") # using with: same as "to = B, arrows = 2"
umxPath("A", with = "B", fixedAt = .5) # 2-head path fixed at .5
umxPath("A", with = c("B", "C"), firstAt = 1) # first covariance fixed at 1
umxPath(cov = c("A", "B"))  # Covariance A <-> B
umxPath(unique.bivariate = letters[1:4]) # bivariate paths a<->b, a<->c, a<->d, b<->c etc.
umxPath(fromEach = letters[1:4]) # bivariate paths a<->b, a<->c, a<->d, b<->c etc.
umxPath(unique.pairs = letters[1:4]) # bivariate paths a<->b, a<->c, a<->d, b<->c etc.
umxPath(Cholesky = c("A1","A2"), to = c("m1", "m2")) # Cholesky

# ====================
# = Cholesky example =
# ====================
## Not run: 
##D latents   = paste0("A", 1:3)
##D manifests = names(demoOneFactor)
##D myData = mxData(cov(demoOneFactor), type = "cov", numObs = 500)
##D m1 <- umxRAM("Chol", data = myData,
##D 	umxPath(Cholesky = latents, to = manifests),
##D 	umxPath(var = manifests),
##D 	umxPath(var = latents, fixedAt = 1.0)
##D )
## End(Not run)

# The following NOT YET implemented!!
# umxPath("A <-> B") # same path as above using a string
# umxPath("A -> B") # one-headed arrow with string syntax
# umxPath("A <> B; A <-- B") # This is ok too
# umxPath("A -> B; B>C; C --> D") # two paths. white space and hyphens not needed
# # manifests is a reserved word, as is latents.
# # It allows the string syntax to use the manifestVars variable
# umxPath("A -> manifests") 



