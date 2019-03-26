library(poppr)


### Name: mlg.filter
### Title: MLG definitions based on genetic distance
### Aliases: mlg.filter mlg.filter,genclone-method
###   mlg.filter,snpclone-method mlg.filter,genind-method
###   mlg.filter,genlight-method mlg.filter<- mlg.filter<-,genclone-method
###   mlg.filter<-,genind-method mlg.filter<-,snpclone-method
###   mlg.filter<-,genlight-method

### ** Examples


data(partial_clone)
pc <- as.genclone(partial_clone, threads = 1L) # convert to genclone object

# Basic Use ---------------------------------------------------------------


# Show MLGs at threshold 0.05
mlg.filter(pc, threshold = 0.05, distance = "nei.dist", threads = 1L)
pc # 26 mlgs

# Set MLGs at threshold 0.05
mlg.filter(pc, distance = "nei.dist", threads = 1L) <- 0.05
pc # 25 mlgs

## Not run: 
##D 
##D # The distance definition is persistant
##D mlg.filter(pc) <- 0.1
##D pc # 24 mlgs
##D 
##D # But you can still change the definition
##D mlg.filter(pc, distance = "diss.dist", percent = TRUE) <- 0.1
##D pc
##D 
##D # Choosing a threshold ----------------------------------------------------
##D 
##D 
##D # Thresholds for collapsing multilocus genotypes should not be arbitrary. It
##D # is important to consider what threshold is suitable. One method of choosing
##D # a threshold is to find a gap in the distance distribution that represents
##D # clonal groups. You can look at this by analyzing the distribution of all
##D # possible thresholds with the function "cutoff_predictor".
##D 
##D # For this example, we'll use Bruvo's distance to predict the cutoff for
##D # P. infestans.
##D 
##D data(Pinf)
##D Pinf
##D # Repeat lengths are necessary for Bruvo's distance
##D (pinfreps <- fix_replen(Pinf, c(2, 2, 6, 2, 2, 2, 2, 2, 3, 3, 2)))
##D 
##D # Now we can collect information of the thresholds. We can set threshold = 1
##D # because we know that this will capture the maximum possible distance:
##D (thresholds <- mlg.filter(Pinf, distance = bruvo.dist, stats = "THRESHOLDS",
##D                           replen = pinfreps, threshold = 1))
##D # We can use these thresholds to find an appropriate cutoff
##D (pcut <- cutoff_predictor(thresholds))
##D mlg.filter(Pinf, distance = bruvo.dist, replen = pinfreps) <- pcut
##D Pinf
##D 
##D # This can also be visualized with the "filter_stats" function.
##D 
##D # Special case: threshold = 0 ---------------------------------------------
##D 
##D 
##D # It's important to remember that a threshold of 0 is equal to the original
##D # MLG definition. This example will show a data set that contains genotypes
##D # with missing data that share all alleles with other genotypes except for 
##D # the missing one.
##D 
##D data(monpop)
##D monpop # 264 mlg
##D mlg.filter(monpop) <- 0
##D nmll(monpop) # 264 mlg
##D 
##D # In order to merge these genotypes with missing data, we should set the 
##D # threshold to be slightly higher than 0. We will use the smallest fraction 
##D # the computer can store.
##D 
##D mlg.filter(monpop) <- .Machine$double.eps ^ 0.5
##D nmll(monpop) # 236 mlg
##D 
##D # Custom distance ---------------------------------------------------------
##D 
##D # Custom genetic distances can be used either in functions from other
##D # packages or user-defined functions
##D 
##D data(Pinf)
##D Pinf
##D mlg.filter(Pinf, distance = function(x) dist(tab(x))) <- 3
##D Pinf
##D mlg.filter(Pinf) <- 4
##D Pinf
##D 
##D # genlight / snpclone objects ---------------------------------------------
##D 
##D 
##D set.seed(999)
##D gc <- as.snpclone(glSim(100, 0, n.snp.struc = 1e3, ploidy = 2))
##D gc # 100 mlgs
##D mlg.filter(gc) <- 0.25
##D gc # 82 mlgs
##D 
## End(Not run)



