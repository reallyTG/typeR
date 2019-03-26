library(DoE.wrapper)


### Name: lhs.design
### Title: Functions for accessing latin hypercube sampling designs from
###   package lhs or space-filling designs from package DiceDesign
### Aliases: lhs.design lhs.augment
### Keywords: array design

### ** Examples

   ## maximin design from package lhs
   plan <- lhs.design(20,7,"maximin",digits=2) 
   plan
   plot(plan)
   cor(plan)
   y <- rnorm(20)
   r.plan <- add.response(plan, y)
   
   ## augmenting the design with 10 additional points, default method
   plan2 <- lhs.augment(plan, m=10)
   plot(plan2)
   cor(plan2)
   
   ## purely random design (usually not ideal)
   plan3 <- lhs.design(20,4,"random",
          factor.names=list(c(15,25), c(10,90), c(0,120), c(12,24)), digits=2)
   plot(plan3)
   cor(plan3)
   
   ## optimum design from package lhs (default)
   plan4 <- lhs.design(20,4,"optimum",
        factor.names=list(torque=c(10,14),friction=c(25,35),
              temperature=c(-5,35),pressure=c(20,50)),digits=2)
   plot(plan4)
   cor(plan4)
   
   ## dmax design from package DiceDesign
   ## arguments range and niter_max are required
   ## ?dmaxDesign for more info
   plan5 <- lhs.design(20,4,"dmax",
        factor.names=list(torque=c(10,14),friction=c(25,35),
              temperature=c(-5,35),pressure=c(20,50)),digits=2,
              range=0.2, niter_max=500)
   plot(plan5)
   cor(plan5)
   
   ## Strauss design from package DiceDesign
   ## argument RND is required
   ## ?straussDesign for more info
   plan6 <- lhs.design(20,4,"strauss",
        factor.names=list(torque=c(10,14),friction=c(25,35),
              temperature=c(-5,35),pressure=c(20,50)),digits=2,
              RND = 0.2)
   plot(plan6)
   cor(plan6)
   
   ## full factorial design from package DiceDesign
   ## mini try-out version
   plan7 <- lhs.design(3,4,"fact",
        factor.names=list(torque=c(10,14),friction=c(25,35),
              temperature=c(-5,35),pressure=c(20,50)),digits=2)
   plot(plan7)
   cor(plan7)
   
   ## Not run: 
##D    
##D    ## full factorial design from package DiceDesign
##D    ## not as many different levels as runs, but only a fixed set of levels
##D    ##    caution: too many levels can easily bring down the computer
##D    ##    above design with 7 distinct levels for each factor, 
##D    ##    implying 2401 runs 
##D    plan7 <- lhs.design(7,4,"fact",
##D         factor.names=list(torque=c(10,14),friction=c(25,35),
##D               temperature=c(-5,35),pressure=c(20,50)),digits=2)
##D    plot(plan7)
##D    cor(plan7)
##D    
##D    ## equivalent call
##D    plan7 <- lhs.design(,4,"fact",nlevels=7,
##D         factor.names=list(torque=c(10,14),friction=c(25,35),
##D               temperature=c(-5,35),pressure=c(20,50)),digits=2)
##D    
##D    ## different number of levels for each factor
##D    plan8 <- lhs.design(,4,"fact",nlevels=c(5,6,5,7),
##D         factor.names=list(torque=c(10,14),friction=c(25,35),
##D               temperature=c(-5,35),pressure=c(20,50)),digits=2)
##D    plot(plan8)
##D    cor(plan8)
##D 
##D    ## equivalent call (specifying nruns, not necessary but a good check)
##D    plan8 <- lhs.design(1050,4,"fact",nlevels=c(5,6,5,7),
##D         factor.names=list(torque=c(10,14),friction=c(25,35),
##D               temperature=c(-5,35),pressure=c(20,50)),digits=2)
##D    
## End(Not run)
   


