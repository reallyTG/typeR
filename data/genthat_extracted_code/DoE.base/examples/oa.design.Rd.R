library(DoE.base)


### Name: oa.design
### Title: Function for accessing orthogonal arrays
### Aliases: oa.design origin oa
### Keywords: array design

### ** Examples

  ## smallest available array for 6 factors with 3 levels each
  oa.design(nfactors=6, nlevels=3)
  ## level combination for which only a full factorial is (currently) found
  oa.design(nlevels=c(4,3,3,2))
  ## array requested via factor.names
  oa.design(factor.names=list(one=c("a","b","c"), two=c(125,275),
     three=c("old","new"), four=c(-1,1), five=c("min","medium","max")))
  ## array requested via character factor.names and nlevels
    ## (with a little German lesson for one two three four five)
  oa.design(factor.names=c("eins","zwei","drei","vier","fuenf"), nlevels=c(2,2,2,3,7))
  ## array requested via explicit name, Taguchi L18
  oa.design(ID=L18)
  ## array requested via explicit name, with column selection
  oa.design(ID=L18.3.6.6.1,columns=c(2,3,7))
  ## array requested with nruns, not very reasonable
  oa.design(nruns=12, nfactors=3, nlevels=2)
  ## array requested with min.residual.df
  oa.design(nfactors=3, nlevels=2, min.residual.df=12)

  ## examples showing alias structures and their improvment with option columns
  plan <- oa.design(nfactors=6,nlevels=3)
  plan
     ## generalized word length pattern
     length3(plan)
     ## length3 (first element of GWP) can be slightly improved by columns="min3"
     plan <- oa.design(nfactors=6,nlevels=3,columns="min3")
     summary(plan)  ## the first 3-level column of the array is not used
     length3(plan)
  plan <- oa.design(nlevels=c(2,2,2,6))
     length3(plan)
  plan.opt <- oa.design(nlevels=c(2,2,2,6),columns="min3") ## substantial improvement
     length3(plan.opt)
     length4(plan.opt)
  ## visualize practical relevance of improvement:
     ## for optimal plan, all 3-dimensional projections are full factorials
  plot(plan, select=1:3)
  plot(plan, select=c(1,2,4))
  plot(plan, select=c(1,3,4))
  plot(plan, select=2:4)
  plot(plan.opt, select=1:3)
  plot(plan.opt, select=c(1,2,4))
  plot(plan.opt, select=c(1,3,4))
  plot(plan.opt, select=2:4)


  ## The last example:
  ## generate an orthogonal array equivalent to Taguchi's L18
  ## by combining L18.3.6.6.1 with a full factorial in 2 and 3 levels
  
  show.oas(nruns=18, parents.only=FALSE)
       ## lineage entry leads the way:
           ## start from L18.3.6.6.1
           ## insert L6.2.1.3.1 for the 6 level factor
  ## prepare the parent
   parent.des <- L18.3.6.6.1
   colnames(parent.des) <- c(Letters[3:9])
       ## new columns will become A and B
  ## 6-level design can be created by fac.design or expand.grid or cbind
   nest.des <- as.matrix(expand.grid(1:3,1:2))[c(1:3,5,6,4),c(2,1)]
        ## want first column to change most slowly
        ## want resulting design to be easily transformable into Taguchi L18
        ## see mathematical comments in section Details
   colnames(nest.des) <- c("A","B")
  ## do the expansion (see mathematical comments in section Details)
  ## using function expansive.replace
  L18.2.1.3.7.manual <- expansive.replace(parent.des, nest.des)[,c(7:8,1:6)]
  L18.2.1.3.7.manual <- L18.2.1.3.7.manual[ord(L18.2.1.3.7.manual),]  ## sort array
      rownames(L18.2.1.3.7.manual) <- 1:18
        ## (ordering is not necessary, just **tidy**)
  ## prepare for using it with function oa.design
        ## note: function expansive.replace creates a matrix of class "oa"
        ## rearranging the columns removed that class and makes it necessary 
        ##    to add the class again for using the array in DoE.base 
  attr(L18.2.1.3.7.manual, "origin") <-
      c(show.oas(name="L18.2.1.3.7", parents.only=FALSE,show=0)$lineage,
        "unconventional order")
  class(L18.2.1.3.7.manual) <- c("oa", "matrix")
  comment(L18.2.1.3.7.manual) <- "Interaction of first two factors estimable"
     ## indicates that first two factors are full factorial from 6-level factor
  origin(L18.2.1.3.7.manual)
  comment(L18.2.1.3.7.manual)
  L18  ## Taguchi array
  L18.2.1.3.7.manual  ## manually expanded array
  oa.design(L18.2.1.3.7, randomize=FALSE)
        ## automatically expanded array
  P3.3(L18.2.1.3.7.manual)  ## length 3 pattern of 3 factor projections
                  ## this also identifies the array as isomorphic to L18
                  ## according to Schoen 2009
  ## the array can now be used in oa.design, like the built-in arrays
  oa.design(ID=L18.2.1.3.7.manual,nfactors=7,nlevels=3)



