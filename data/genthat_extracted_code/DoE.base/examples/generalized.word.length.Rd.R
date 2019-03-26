library(DoE.base)


### Name: generalized.word.length
### Title: Functions for calculating the generalized word length pattern,
###   projection frequency tables or optimizing column selection within an
###   array
### Aliases: generalized.word.length length2 length3 length4 length5
###   lengths lengths.default lengths.design lengths.matrix contr.XuWu
###   contr.XuWuPoly P2.2 P3.3 P4.4 oa.min3 oa.min4 oa.min34 oa.max3
###   oa.max4 oa.maxGR oa.minRelProjAberr nchoosek tupleSel tupleSel.design
###   tupleSel.default
### Keywords: design array

### ** Examples

   ## check a small design
   oa12 <- oa.design(nlevels=c(2,2,6))
   length3(oa12)
   ## length4 is of course 0, because there are only 3 factors
   P3.3(oa12)

   ## the results need not be an integer
   oa12 <- oa.design(L12.2.11,columns=1:6)
   length3(oa12)
   length4(oa12)
   P3.3(oa12)  ## all projections have the same pattern
             ## which is known to be true for the complete L12.2.11 as well
   P3.3(L18)   ## this is the pattern of the Taguchi L18
             ## also published by Schoen 2009
   P3.3(L18[,-2])  ## without the 2nd column (= the 1st 3-level column)
   P3.3(L18[,-2], rela=TRUE)  ## relative pattern, divided by theoretical upper
                              ## bound for each 3-factor projection

   ## choosing among different assignment possibilities
   ## for two 2-level factors and one 3- and 4-level factor each
   show.oas(nlevels=c(2,2,3,4))
   ## default allocation: first two columns for the 2-level factors
   oa24.bad <- oa.design(L24.2.13.3.1.4.1, columns=c(1,2,14,15))
   length3(oa24.bad)
   ## much better: columns 3 and 10
   oa24.good <- oa.design(L24.2.13.3.1.4.1, columns=c(3,10,14,15))
   length3(oa24.good)
   length4(oa24.good)  ## there are several variants,
                       ## which produce the same pattern for lengths 3 and 4

   ## the difference matters
   plot(oa24.bad, select=c(2,3,4))
   plot(oa24.good, select=c(2,3,4))

   ## generalized resolution differs as well (resolution is III in both cases)
   GR(oa24.bad)
   GR(oa24.good)

   ## and analogously also GRind and ARFT and SCFT
   GRind(oa24.bad)
   GRind(oa24.good)

   ## GR and GRind can be different
   GRind(L18[, c(1:4,6:8)], arft=FALSE, scft=FALSE)

   ## choices for columns can be explored with functions oa.min3, oa.min34 or oa.max3
   oa.min3(L24.2.13.3.1.4.1, nlevels=c(2,2,3,4))
   oa.min34(L24.2.13.3.1.4.1, nlevels=c(2,2,3,4))
   ## columns for designs with maximum generalized resolution
   ##    (can take very long, if all designs have worst-case aliasing)
      ## then optimize these for overall relative number of words of length 3
      ##     and in addition absolute number of words of length 4
   mGR <- oa.maxGR(L18, c(2,3,3,3,3,3,3))
   oa.minRelProjAberr(L18, c(2,3,3,3,3,3,3), maxGR=mGR)

   oa.max3(L24.2.13.3.1.4.1, nlevels=c(2,2,3,4))    ## this is not for finding
                                                    ## a good design!!!

   ## Not run: 
##D    ## play with selection of optimum design
##D    ## somewhat experimental at present
##D    oa.min3(L32.2.10.4.7, nlevels=c(2,2,2,4,4,4,4,4))
##D    best3 <- oa.min3(L32.2.10.4.7, nlevels=c(2,2,2,4,4,4,4,4), rela=TRUE)
##D    oa.min34(L32.2.10.4.7, nlevels=c(2,2,2,4,4,4,4,4))
##D    oa.min34(L32.2.10.4.7, nlevels=c(2,2,2,4,4,4,4,4), min3=best3)
##D 
##D    ## generalized resolution according to Groemping 2011, manually
##D    best3GR <- oa.min3(L36.2.11.3.12, c(rep(2,3),rep(3,3)), rela=TRUE, crit="worst")
##D       ## optimum GR is 3.59
##D    ## subsequent optimization w.r.t. rA3
##D    best3reltot.GR <- oa.min3(L36.2.11.3.12, c(rep(2,3),rep(3,3)), rela=TRUE,
##D            variants=best3GR$column.variants)
##D       ## optimum rA3 is 0.5069
##D    ## (note: different from first optimizing rA3 (0.3611) and then GR (3.5))
##D    ## remaining nine designs: optimize RPFTs
##D    L36 <- oa.design(L36.2.11.3.12, randomize=FALSE)
##D    lapply(1:9, function(obj) P3.3(L36[,best3reltot.GR$column.variants[obj,]]))
##D       ## all identical
##D    oa.min34(L36, nlevels=c(rep(2,3),rep(3,3)), min3=best3reltot.GR)
##D       ## still all identical
##D    
## End(Not run)

   ## select among column variants with projection frequencies
   ## here, all variants have identical projection frequencies
   ## for larger problems, this may sometimes be relevant
   variants <- oa.min34(L24.2.13.3.1.4.1, nlevels=c(2,2,3,4))
   for (i in 1:nrow(variants$column.variants)){
      cat("variant ", i, "\n")
      print(P3.3(oa.design(L24.2.13.3.1.4.1, columns=variants$column.variants[i,])))
      }

   ## automatic optimization is possible, but can be time-consuming
   ## (cf. help for oa.design)
   plan <- oa.design(L24.2.13.3.1.4.1, nlevels=c(2,2,3,4), columns="min3")
   length3(plan)
   length4(plan)
   plan <- oa.design(L24.2.13.3.1.4.1, nlevels=c(2,2,3,4), columns="min34")
   length3(plan)
   length4(plan)

   ## Not run: 
##D    ## blocked design from FrF2
##D    ## the design is of resolution IV
##D    ## there is one (generalized) 4-letter word that does not involve the block factor
##D    ## there are four more 4-letter words involving the block factor
##D    ## all this and more can also be learnt from design.info(plan)
##D    require(FrF2)
##D    plan <- FrF2(32,6,blocks=4)
##D    length3(plan)
##D    length3(plan, with.blocks=TRUE)
##D    length4(plan)
##D    length4(plan, with.blocks=TRUE)
##D    design.info(plan)
##D    
## End(Not run)




