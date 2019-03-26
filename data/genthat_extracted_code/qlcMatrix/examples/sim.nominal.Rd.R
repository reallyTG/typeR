library(qlcMatrix)


### Name: sim.nominal
### Title: Similarity-measures for nominal variables
### Aliases: sim.nominal sim.att sim.obs

### ** Examples

# first a simple example using the farms-dataset from MASS
library(MASS)

# similarities between farms
s <- sim.obs(farms)
plot(hclust(as.dist(1-s), method = "ward.D"))

# similarities between attributes (`variables`)
s <- sim.att(farms)
plot(hclust(as.dist(1-s), method = "ward.D"))

# use the split option for multi-valued cells
farms2 <- as.matrix(farms)
farms2[1,1] <- "M1,M5"

s <- sim.obs(farms2, split = ",")
plot(hclust(as.dist(1-s), method = "ward.D"))

## Not run: 
##D # a larger example with lots of missing data: the WALS-data as included here
##D # computations go reasonably quick
##D # (on 2566 observations and 131 attributes with 630 different values in total)
##D data(wals)
##D system.time(s <- sim.att(wals$data))
##D rownames(s) <- colnames(wals$data)
##D plot(hclust(as.dist(1-s), method = "ward.D"), cex = 0.5)
##D 
##D # Note that using sparse=T speeds up computations because it 
##D # ignores zero co-occurrences
##D # This leads to small errors in the computation of Chuprov's T
##D system.time( # faster
##D 	chup.sparse <- sim.att(wals$data,  method = "chuprov", sparse = TRUE)
##D )
##D system.time( # slower
##D 	chup.full <- sim.att(wals$data, method = "chuprov", sparse = FALSE)
##D )
##D 
##D # The sparse approach is almost identical to the full approach.
##D # sparse sligtly underestimates the real values for Chuprov's T 
##D plot(as.dist(chup.sparse), as.dist(chup.full))
##D 
##D # some more similarities on the attributes
##D g <- sim.att(wals$data, method = "g") # Dunning's G
##D m <- sim.att(wals$data, method = "mutual") # Mutual Information
##D v <- sim.att(wals$data, method = "variation") # Variation of Information
##D 
##D # Note the strong differences between these approaches
##D pairs(~ as.dist(chup.sparse) + as.dist(m) + as.dist(g) + as.dist(v),
##D 	labels=c("Chuprov's T","Mutual Information","G-statistic","Variation of Information"))
##D 	
##D # Relative Hamming similarity on all observations (languages) in WALS
##D # time is not a problem, but the data is so sparse
##D # that for many language-pairs there is no shared data
##D system.time( s <- sim.obs(wals$data))
##D 
##D # select only the 168 language with more than 80 datapoints
##D sel <- wals$data[apply(wals$data,1,function(x){sum(!is.na(x))})>80,]
##D 
##D # compare different similarities
##D w <- sim.obs(sel, "weighted")
##D h <- sim.obs(sel, "hamming")
##D r <- sim.obs(sel, "res")
##D p <- sim.obs(sel, "poi")
##D m <- sim.obs(sel, "wpmi")
##D i <- sim.obs(sel, "pmi")
##D 
##D pairs(~ as.dist(w) + as.dist(h) + as.dist(r) + as.dist(p) + as.dist(m) + as.dist(i),
##D 	labels = c("weighted","hamming","residuals","poisson","weighted PMI","PMI"))
## End(Not run)



