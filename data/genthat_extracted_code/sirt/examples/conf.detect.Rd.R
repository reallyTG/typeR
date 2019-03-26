library(sirt)


### Name: conf.detect
### Title: Confirmatory DETECT and polyDETECT Analysis
### Aliases: conf.detect summary.conf.detect
### Keywords: DETECT

### ** Examples

#############################################################################
# EXAMPLE 1: TIMSS mathematics data set (dichotomous data)
#############################################################################
data(data.timss)

# extract data
dat <- data.timss$data
dat <- dat[, substring( colnames(dat),1,1)=="M" ]
# extract item informations
iteminfo <- data.timss$item
# estimate Rasch model
mod1 <- sirt::rasch.mml2( dat )
# estimate WLEs
wle1 <- sirt::wle.rasch( dat, b=mod1$item$b )$theta

# DETECT for content domains
detect1 <- sirt::conf.detect( data=dat, score=wle1,
                    itemcluster=iteminfo$Content.Domain )
  ##          unweighted weighted
  ##   DETECT      0.316    0.316
  ##   ASSI        0.273    0.273
  ##   RATIO       0.355    0.355

## Not run: 
##D # DETECT cognitive domains
##D detect2 <- sirt::conf.detect( data=dat, score=wle1,
##D                     itemcluster=iteminfo$Cognitive.Domain )
##D   ##          unweighted weighted
##D   ##   DETECT      0.251    0.251
##D   ##   ASSI        0.227    0.227
##D   ##   RATIO       0.282    0.282
##D 
##D # DETECT for item format
##D detect3 <- sirt::conf.detect( data=dat, score=wle1,
##D                     itemcluster=iteminfo$Format )
##D   ##          unweighted weighted
##D   ##   DETECT      0.056    0.056
##D   ##   ASSI        0.060    0.060
##D   ##   RATIO       0.062    0.062
##D 
##D # DETECT for item blocks
##D detect4 <- sirt::conf.detect( data=dat, score=wle1,
##D                     itemcluster=iteminfo$Block )
##D   ##          unweighted weighted
##D   ##   DETECT      0.301    0.301
##D   ##   ASSI        0.193    0.193
##D   ##   RATIO       0.339    0.339 
## End(Not run)

# Exploratory DETECT: Application of a cluster analysis employing the Ward method
detect5 <- sirt::expl.detect( data=dat, score=wle1,
                nclusters=10, N.est=nrow(dat)  )
# Plot cluster solution
pl <- graphics::plot( detect5$clusterfit, main="Cluster solution" )
stats::rect.hclust(detect5$clusterfit, k=4, border="red")

## Not run: 
##D #############################################################################
##D # EXAMPLE 2: Big 5 data set (polytomous data)
##D #############################################################################
##D 
##D # attach Big5 Dataset
##D data(data.big5)
##D 
##D # select 6 items of each dimension
##D dat <- data.big5
##D dat <- dat[, 1:30]
##D 
##D # estimate person score by simply using a transformed sum score
##D score <- stats::qnorm( ( rowMeans( dat )+.5 )  / ( 30 + 1 ) )
##D 
##D # extract item cluster (Big 5 dimensions)
##D itemcluster <- substring( colnames(dat), 1, 1 )
##D 
##D # DETECT Item cluster
##D detect1 <- sirt::conf.detect( data=dat, score=score, itemcluster=itemcluster )
##D   ##        unweighted weighted
##D   ## DETECT      1.256    1.256
##D   ## ASSI        0.384    0.384
##D   ## RATIO       0.597    0.597
##D 
##D # Exploratory DETECT
##D detect5 <- sirt::expl.detect( data=dat, score=score,
##D                      nclusters=9, N.est=nrow(dat)  )
##D   ## DETECT (unweighted)
##D   ## Optimal Cluster Size is  6  (Maximum of DETECT Index)
##D   ##   N.Cluster N.items N.est N.val      size.cluster DETECT.est ASSI.est RATIO.est
##D   ## 1         2      30   500     0              6-24      1.073    0.246     0.510
##D   ## 2         3      30   500     0           6-10-14      1.578    0.457     0.750
##D   ## 3         4      30   500     0         6-10-11-3      1.532    0.444     0.729
##D   ## 4         5      30   500     0        6-8-11-2-3      1.591    0.462     0.757
##D   ## 5         6      30   500     0       6-8-6-2-5-3      1.610    0.499     0.766
##D   ## 6         7      30   500     0     6-3-6-2-5-5-3      1.557    0.476     0.740
##D   ## 7         8      30   500     0   6-3-3-2-3-5-5-3      1.540    0.462     0.732
##D   ## 8         9      30   500     0 6-3-3-2-3-5-3-3-2      1.522    0.444     0.724
##D 
##D # Plot Cluster solution
##D pl <- graphics::plot( detect5$clusterfit, main="Cluster solution" )
##D stats::rect.hclust(detect5$clusterfit, k=6, border="red")
##D 
##D #############################################################################
##D # EXAMPLE 3: DETECT index for unidimensional data
##D #############################################################################
##D 
##D set.seed(976)
##D N <- 1000
##D I <- 20
##D b <- sample( seq( -2, 2, len=I) )
##D dat <- sirt::sim.raschtype( stats::rnorm(N), b=b )
##D 
##D # estimate Rasch model and corresponding WLEs
##D mod1 <- TAM::tam.mml( dat )
##D wmod1 <- TAM::tam.wle(mod1)$theta
##D 
##D # define item cluster
##D itemcluster <- c( rep(1,5), rep(2,I-5) )
##D 
##D # compute DETECT statistic
##D detect1 <- sirt::conf.detect( data=dat, score=wmod1, itemcluster=itemcluster)
##D   ##            unweighted weighted
##D   ##  DETECT        -0.184   -0.184
##D   ##  ASSI          -0.147   -0.147
##D   ##  RATIO         -0.226   -0.226
##D   ##  MADCOV100      0.816    0.816
##D   ##  MCOV100       -0.786   -0.786
## End(Not run)



