library(aSPU)


### Name: MTaSPUsSetPath
### Title: Multitraits - Pathway based Sum of Powered Score tests
###   (MTSPUsSetPath) and adaptive MTSPUsSetpath (MTaSPUsSetPath) test for
###   multi trait - pathway association with GWAS summary statistics.
### Aliases: MTaSPUsSetPath

### ** Examples


Zs <- cbind ( c( 0.3, 0.2, 0.1,0.5,1.2),
          c(-.1, .3,-.1,.1,1.2) )

varSNP = cbind( c( 1, .1,0, 0, .11),
               c(.1,1, 0, 0, 0),
               c(0,0, 1, 0, 0),
               c(0,0, 0, 1, 0),
               c(.11,0,0,0,1) )

varPhe = cbind( c( 1, -.1),
               c(-.1,1) )

gene.info = data.frame( Gnm = c( "G1", "G2"), chr = c(1,3),
                    loc1 = c(0, 0), loc2 = c(10,10) )
snp.info = data.frame( rsid = c("rs1", "rs2", "rs3", "rs4", "rs5"),
                chr = c(1,1,3,3,3), loc = c(1,2,1,2,3) )
 out <- MTaSPUsSetPath(Zs, corPhe = varPhe, corSNP=varSNP,
            n.perm = 100, snp.info = snp.info, gene.info = gene.info)
out




