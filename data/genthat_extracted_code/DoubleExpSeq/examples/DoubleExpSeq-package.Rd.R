library(DoubleExpSeq)


### Name: DoubleExpSeq-package
### Title: DoubleExpSeq is a package with application to RNA-Seq
###   experiments that tests for differential exon usage.
### Aliases: DoubleExpSeq-package DoubleExpSeq
### Keywords: package

### ** Examples

## Toy exon data: "counts"=inclusion counts, "offsets"=total counts, "groups"=experiment design
  data(exon)
  
  ## Default will compare "G1" & "G2" using the WEB-Seq method
  ## and uses ALL groups to estimate dispersion
    results.G1G2.WEB <- DBGLM1( counts, offsets, groups)
    
    # Compare G1 & G3
    results.G1G3.WEB <- DBGLM1( counts, offsets, groups, contrast=c(1,3))
	
    # Compare G1 & G3. Does not use G2 for dispersion estimation.
    results.G1G3.noG2.WEB <- DBGLM1(counts, offsets, groups, contrast=c(1,3), use.all.groups=FALSE)
	    
    # Global minimum check of the weight parameter estimate in the WEB-Seq method.
    optimPlot( counts, offsets, groups, contrast=c(1,3), use.all.groups=FALSE)
		
## The DEB-Seq method. Less conservative, more powerful. Very similar ranks to WEB-Seq.
  results.G1G2.DEB <- DBGLM1( counts, offsets, groups, shrink.method="DEB")
		  
## M-A Plot
  WEB.sig <- rownames(results.G1G2.WEB$Sig)
  DB.MAPlot( counts, offsets, groups, de.tags=WEB.sig, main="WEB-Seq")



