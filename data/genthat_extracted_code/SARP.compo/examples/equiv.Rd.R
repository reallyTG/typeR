library(SARP.compo)


### Name: equivalence
### Title: Utility function to obtain p-value for equivalence tests on
###   individual ratios
### Aliases: equivalence equiv.fpc
### Keywords: compositional equivalence

### ** Examples

   # load the reference genes data set
   data( generef )

   # compute equivalence test of all ratios
   #  Genes are in column 3 to 35
   #  Only the first 10 genes are used here, for speed reasons
   #  Equivalence is defined as a change lower than 0.5 Cq (× 1.41)
   #  Values are expressed as Cq : already in log
   Mp <- creer.Mp( generef, names( generef )[ 3:13 ], log = TRUE,
                   f.p = equiv.fpc, Delta = 0.5, v.X = 'Group' )

   # Make the graph from it, and plot it
   #  Threshold is set at 0.15, for 10 nodes...
   #  (using the complement, to keep edges with p < threshold only )
   plot( grf.Mp( Mp, p = 0.15, complement = TRUE ) )
   #  => there is a single clique, of 3 genes : HPRT1, B2M, HSP90AB1
   #     only these three genes are "proved" to have the same variation



