##  VT::03.09.2016 - this will render the output independent
##  from the version of the package
suppressPackageStartupMessages(library(tclust))

require(tclust)
require(mvtnorm)
#--- EXAMPLE 1 ------------------------------------------

set.seed(123)
sig <- diag (2)
cen <- rep (1,2)
x <- rbind(mvtnorm::rmvnorm(360, cen * 0,   sig),
            mvtnorm::rmvnorm(540, cen * 5,   sig * 6 - 2),
            mvtnorm::rmvnorm(100, cen * 2.5, sig * 50)
           )

# Two groups and 10% trimming level
(clus <- tclust (x, k = 2, alpha = 0.1, restr.fact = 8))


# Three groups (one of them very scattered) and 0% trimming level
(clus <- tclust (x, k = 3, alpha=0.0, restr.fact = 100))


#--- EXAMPLE 3 ------------------------------------------
set.seed(123)
data (M5data)
x <- M5data[, 1:2]

(clus.a <- tclust (x, k = 3, alpha = 0.1, restr.fact =  1,
                  restr = "eigen", equal.weights = TRUE, warnings = 1))
(clus.b <- tclust (x, k = 3, alpha = 0.1, restr.fact =  1,
                    equal.weights = TRUE, warnings = 1))
(clus.c <- tclust (x, k = 3, alpha = 0.1, restr.fact =  1,
                  restr = "deter", equal.weights = TRUE, iter.max = 100,
		  warnings = 1))
(clus.d <- tclust (x, k = 3, alpha = 0.1, restr.fact = 50,
                  restr = "eigen", equal.weights = FALSE))

#--- EXAMPLE 4 ------------------------------------------
set.seed(123)
data (swissbank)
# Two clusters and 8% trimming level
(clus <- tclust (swissbank, k = 2, alpha = 0.08, restr.fact = 50))

# Three clusters and 0% trimming level
(clus <- tclust (swissbank, k = 3, alpha = 0.0, restr.fact = 110))


##### Discriminant Factor Analysis for tclust Objects ############################
sig <- diag (2)
cen <- rep (1, 2)
x <- rbind(mvtnorm::rmvnorm(360, cen * 0,   sig),
	       mvtnorm::rmvnorm(540, cen * 5,   sig * 6 - 2),
	       mvtnorm::rmvnorm(100, cen * 2.5, sig * 50)
)
(clus.1 <- tclust (x, k = 2, alpha = 0.1, restr.fact = 12))

(clus.2 <- tclust (x, k = 3, alpha = 0.1, restr.fact = 1))
  ##  restr.fact and k are chosen improperly for pointing out the
  ##    difference in the plot of DiscrFact

(dsc.1 <- DiscrFact (clus.1))
(dsc.2 <- DiscrFact (clus.2))




########## Classification Trimmed Likelihood Curves  ###################

## Do not run - it takes too long and can show differences on some
##  architectures due to the random numbers.
##
if(FALSE)
{
#--- EXAMPLE 1 ------------------------------------------

    sig <- diag (2)
    cen <- rep (1, 2)
    x <- rbind(mvtnorm::rmvnorm(108, cen * 0,   sig),
    	       mvtnorm::rmvnorm(162, cen * 5,   sig * 6 - 2),
    	       mvtnorm::rmvnorm(30, cen * 2.5, sig * 50)
    )

    (ctl <- ctlcurves (x, k = 1:4))

}

#--- EXAMPLE 2 ------------------------------------------

data (geyser2)
(ctl <- ctlcurves (geyser2, k = 1:5))
