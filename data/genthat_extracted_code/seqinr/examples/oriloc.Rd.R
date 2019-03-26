library(seqinr)


### Name: oriloc
### Title: Prediction of origin and terminus of replication in bacteria.
### Aliases: oriloc

### ** Examples

## Not run: 
##D #
##D # A little bit too long for routine checks because oriloc() is already
##D # called in draw.oriloc.Rd documentation file. Try example(draw.oriloc)
##D # instead, or copy/paste the following code:
##D #
##D out <- oriloc()
##D plot(out$st, out$sk, type = "l", xlab = "Map position in Kb",
##D     ylab = "Cumulated composite skew", 
##D     main = expression(italic(Chlamydia~~trachomatis)~~complete~~genome))
##D #
##D # Example with a single GenBank file:
##D #
##D out2 <- oriloc(gbk="ftp://pbil.univ-lyon1.fr/pub/seqinr/data/ct.gbk")
##D draw.oriloc(out2)
##D #
##D # (some warnings are generated because of join in features and a gene that
##D # wrap around the genome)
##D #
## End(Not run)



