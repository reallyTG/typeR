library(FrF2)


### Name: FrF2
### Title: Function to provide regular Fractional Factorial 2-level designs
### Aliases: FrF2 FrF2.currentlychecked
### Keywords: array design

### ** Examples

## maximum resolution minimum aberration design with 4 factors in 8 runs
FrF2(8,4)
## the design with changed default level codes
FrF2(8,4, default.level=c("current","new"))
## the design with number of factors specified via factor names 
      ## (standard level codes)
FrF2(8,factor.names=list(temp="",press="",material="",state=""))
## the design with changed factor names and factor-specific level codes
FrF2(8,4, factor.names=list(temp=c("min","max"),press=c("low","normal"),
     material=c("current","new"),state=c("new","aged")))
## a full factorial
FrF2(8,3, factor.names=list(temp=c("min","max"),press=c("low","normal"),
     material=c("current","new")))
## a replicated full factorial (implicit by low number of factors)
FrF2(16,3, factor.names=list(temp=c("min","max"),press=c("low","normal"),
     material=c("current","new")))
## three ways for custom specification of the same design
FrF2(8, generators = "ABC")
FrF2(8, generators = 7)
FrF2(8, generators = list(c(1,2,3)))
## more than one generator
FrF2(8, generators = c("ABC","BC"))
FrF2(8, generators = c(7,6))
FrF2(8, generators = list(c(1,2,3),c(2,3)))
## alias structure for three generators that differ only by sign
design.info(FrF2(16,generators=c(7,13,15),randomize=FALSE))$aliased
design.info(FrF2(16,generators=c(7,-13,15),randomize=FALSE))$aliased
design.info(FrF2(16,generators=c(-7,-13,-15),randomize=FALSE))$aliased
## finding smallest design with resolution 5 in 7 factors
FrF2(nfactors=7, resolution=5)
## same design, but with 12 center points in 6 positions
FrF2(nfactors=7, resolution=5, ncenter=12, center.distribute=6)


## maximum resolution minimum aberration design with 9 factors in 32 runs
## show design information instead of design itself
design.info(FrF2(32,9))
## maximum number of free 2-factor interactions instead of minimum aberration
## show design information instead of design itself
design.info(FrF2(32,9,MaxC2=TRUE))

## usage of replication
## shows run order instead of design itself
run.order(FrF2(8,4,replication=2,randomize=FALSE))
run.order(FrF2(8,4,replication=2,repeat.only=TRUE,randomize=FALSE))
run.order(FrF2(8,4,replication=2))
run.order(FrF2(8,4,replication=2,repeat.only=TRUE))


## Not run: 
##D ## examples below do work, but are repeated in the 
##D ## respective method's separate help file and are therefore prevented 
##D ## from running twice
##D 
##D ########## automatic blocked designs ###################
##D ## from a full factorial ##
##D FrF2(8,3,blocks=2)
##D ## with replication
##D run.order(FrF2(8,3,blocks=2,wbreps=2))
##D run.order(FrF2(8,3,blocks=2,wbreps=2,repeat.only=TRUE))
##D run.order(FrF2(8,3,blocks=2,bbreps=2))
##D run.order(FrF2(8,3,blocks=2,bbreps=2,wbreps=2))
##D 
##D ## automatic blocked design with fractions
##D FrF2(16,7,blocks=4,alias.block.2fis=TRUE,factor.names=c("MotorSpeed", 
##D       "FeedMode","FeedSizing","MaterialType","Gain","ScreenAngle","ScreenVibLevel"))
##D ## isomorphic non-catalogued design as basis
##D FrF2(16,gen=c(7,11,14),blocks=4,alias.block.2fis=TRUE)
##D ## FrF2 uses blockpick.big and ignores the generator
##D FrF2(64,gen=c(7,11,14),blocks=16,alias.block.2fis=TRUE)
##D 
##D ########## manual blocked design ####################
##D ### example that shows why order of blocks is not randomized
##D ### can of course be randomized by user, if appropriate
##D FrF2(32,9,blocks=c("Day","Shift"),alias.block.2fis=TRUE, 
##D     factor.names=list(Day=c("Wednesday","Thursday"), Shift=c("Morning","Afternoon"),
##D         F1="",F2="",F3="",F4="",F5="",F6="",F7=""), default.levels=c("current","new"))
##D 
##D ########## hard to change factors ####################
##D ## example from Bingham and Sitter Technometrics 19999
##D ## MotorSpeed, FeedMode,FeedSizing,MaterialType are hard to change
##D BS.ex <- FrF2(16,7,hard=4,
##D      factor.names=c("MotorSpeed", "FeedMode","FeedSizing","MaterialType",
##D                   "Gain","ScreenAngle","ScreenVibLevel"), 
##D      default.levels=c("-","+"),randomize=FALSE)
##D design.info(BS.ex)
##D BS.ex
##D ## NOTE: the design has 8 whole plots.
##D ## If randomize=FALSE is used like here, the first hard-to-change factors 
##D ## do not always change between whole plots. 
##D ## A conscious and honest decision is required whether this is 
##D ##    acceptable for the situation at hand!
##D ## randomize=TRUE would cause more changes in the first four factors.
##D 
##D ########## automatic generation for split plot ##########
##D ## 3 control factors, 5 noise factors, control factors are whole plot factors
##D ## 8 plots desired in a total of 32 runs
##D ## Bingham Sitter 2003
##D BS.ex2a <- FrF2(32, 8, WPs=8, nfac.WP=3, 
##D       factor.names=c(paste("C",1:3,sep=""), paste("N",1:5,sep="")),randomize=TRUE)
##D 
##D ## manual generation of this same design
##D BS.ex2m <- FrF2(32, 8, generators=c("ABD","ACD","BCDE"),WPs=8, WPfacs=c("C1","C2","C3"), nfac.WP=3, 
##D       factor.names=c(paste("C",1:3,sep=""),paste("N",1:5,sep="")),randomize=TRUE)
##D 
##D ## design with few whole plot factors
##D ## 2 whole plot factors, 7 split plot factors
##D ## 8 whole plots, i.e. one extra WP factor needed
##D BSS.cheese.exa <- FrF2(32, 9, WPs=8, nfac.WP=2, 
##D       factor.names=c("A","B","p","q","r","s","t","u","v"))
##D design.info(BSS.cheese.exa)
##D ## manual generation of the design used by Bingham, Schoen and Sitter
##D ## note that the generators include a generator for the 10th spplitting factor
##D     ## s= ABq, t = Apq, u = ABpr and v = Aqr, splitting factor rho=Apqr
##D BSS.cheese.exm <- FrF2(32, gen=list(c(1,2,4),c(1,3,4),c(1,2,3,5),c(1,4,5),c(1,3,4,5)), 
##D       WPs=8, nfac.WP=3, WPfacs=c(1,2,10),
##D       factor.names=c("A","B","p","q","r","s","t","u","v","rho"))
##D design.info(BSS.cheese.exm)
##D 
##D ########## usage of estimable ###########################
##D   ## design with all 2fis of factor A estimable on distinct columns in 16 runs
##D   FrF2(16, nfactors=6, estimable = rbind(rep(1,5),2:6), clear=FALSE)
##D   FrF2(16, nfactors=6, estimable = c("AB","AC","AD","AE","AF"), clear=FALSE)
##D   FrF2(16, nfactors=6, estimable = formula("~A+B+C+D+E+F+A:(B+C+D+E+F)"), 
##D        clear=FALSE)
##D             ## formula would also accept self-defined factor names
##D             ## from factor.names instead of letters A, B, C, ...
##D             
##D   ## estimable does not need any other input
##D   FrF2(estimable=formula("~(A+B+C)^2+D+E"))
##D 
##D   ## estimable with factor names 
##D   ## resolution three must be permitted, as FrF2 first determines that 8 runs 
##D   ##     would be sufficient degrees of freedom to estimate all effects 
##D   ##     and then tries to accomodate the 2fis from the model clear of aliasing in 8 runs
##D   FrF2(estimable=formula("~one+two+three+four+two:three+two:four"), 
##D        factor.names=c("one","two","three","four"), res3=TRUE)
##D   ## clear=FALSE allows to allocate all effects on distinct columns in the 
##D   ##     8 run MA resolution IV design
##D   FrF2(estimable=formula("~one+two+three+four+two:three+two:four"), 
##D        factor.names=c("one","two","three","four"), clear=FALSE)
##D 
##D   ## 7 factors instead of 6, but no requirements for factor G
##D   FrF2(16, nfactors=7, estimable = formula("~A+B+C+D+E+F+A:(B+C+D+E+F)"), 
##D        clear=FALSE)
##D   ## larger design for handling this with all required effects clear
##D   FrF2(32, nfactors=7, estimable = formula("~A+B+C+D+E+F+A:(B+C+D+E+F)"), 
##D        clear=TRUE)
##D   ## 16 run design for handling this with required 2fis clear, but main effects aliased
##D   ## (does not usually make sense)
##D   FrF2(16, nfactors=7, estimable = formula("~A+B+C+D+E+F+A:(B+C+D+E+F)"), 
##D        clear=TRUE, res3=TRUE)
## End(Not run)
## example for the sort option added with version 1.6-1
## and for usage of a catalogue from package FrF2.catlg128 (simplified with version 1.6-5)
  ## Not run: 
##D   estim <- compromise(17,15:17)$requirement  ## all interactions of factors 15 to 17 (P,Q,R)
##D   ## VF2 algorithm without pre-sorting of vertices
##D   FrF2(128, 17, estimable=estim, select.catlg=catlg128.17) ## very slow,  
##D                                                            ## interrupt with ESC key
##D   ## VF2 algorithm with pre-sorting of vertices
##D   FrF2(128, 17, estimable=estim, sort="high", select.catlg=catlg128.17)  ## very fast
##D   FrF2(128, 17, estimable=estim, sort="low", select.catlg=catlg128.17)  ## very fast
##D   ## LAD algorithm
##D   FrF2(128, 17, estimable=estim, method="LAD", select.catlg=catlg128.17)  ## very fast
##D   ## guaranteed to be MA clear design 
##D   ## only works, if package FrF2.catlg128 is installed
##D   
## End(Not run)

## example for necessity of perms, and uses of select.catlg and perm.start
## based on Wu and Chen Example 1
  ## Not run: 
##D   ## runs per default about max.time=60 seconds, before throwing error with 
##D   ##        interim results
##D   ## results could be used in select.catlg and perm.start for restarting with 
##D   ##       calculation of further possibilities
##D   FrF2(32, nfactors=11, estimable = formula("~(A+B+C+D+E+F)^2"), clear=FALSE)
##D   ## would run for a long long time (I have not yet been patient enough)
##D   FrF2(32, nfactors=11, estimable = formula("~(A+B+C+D+E+F)^2"), clear=FALSE, 
##D        max.time=Inf)
##D   ## can be easily done with perms, 
##D   ## as only different subsets of six factors are non-isomorphic
##D   perms.6 <- combn(11,6)
##D   perms.full <- matrix(NA,ncol(perms.6),11)
##D   for (i in 1:ncol(perms.6))
##D      perms.full[i,] <- c(perms.6[,i],setdiff(1:11,perms.6[,i]))
##D   FrF2(32, nfactors=11, estimable = formula("~(A+B+C+D+E+F)^2"), clear=FALSE, 
##D       perms = perms.full )
##D   
## End(Not run)



