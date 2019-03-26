library(SLDAssay)


### Name: get.mle
### Title: IUPM, PGOF, and CI
### Aliases: get.mle

### ** Examples

# Duplicates row 4 of Table 4 from Myers, et. al.
# Myers et. al. divides IUPM space into discrete values. This package searches
# entire parameter space, yielding a slightly different and more accurate MLE.
row4 <- get.mle(pos=c(2,1,0,0,0,0),  # Number of positive wells per dilution level
                 replicates=rep(2,6), # Number of replicates per dilution level
                 dilutions=c(1e6,2e5,4e4,8e3,1600,320), # Cells per dilution level
                 conf.level=0.95,   # Significance level
                 iupm=TRUE,            # Display MLE in infected units per million
                 )

# Duplicates row 21 of Table 4 from Myers, et. al.
# Low PGOF example
# Myers et. al. divides IUPM space into discrete values. This package searches
# entire parameter space, yielding a slightly different and more accurate MLE.
row21 <- get.mle(pos=c(2,2,2,0,1,0),
                 replicates=rep(2,6),
                 dilutions=c(1e6,2e5,4e4,8e3,1600,320),
                 conf.level=0.95,
                 iupm=TRUE)
                 
# Example calculating IUs per cell for an assay with 1 DL.
 iu.example <- get.mle(pos=7, replicates=8, dilutions=25,
                       conf.level=0.95, iupm=FALSE)

# Monte Carlo example
# 67,081 total possible positive well outcomes, therefore
# Monte Carlo sampling is used to reduce computation time.
MC.example <- get.mle(pos=c(30,9,1,0),
                       replicates=c(36,36,6,6),
                       dilutions=c(2.5e6,5e5,1e5,2.5e4),
                       conf.level=0.95,
                       monte = 5000,
                       iupm=TRUE )



