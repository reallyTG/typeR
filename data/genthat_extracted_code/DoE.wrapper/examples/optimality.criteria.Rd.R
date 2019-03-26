library(DoE.wrapper)


### Name: optimality.criteria
### Title: Overview of optimality criteria in experimental design packages
### Aliases: optimality.criteria Scalc compare
### Keywords: array design

### ** Examples

   ## optimum design from package lhs (default)
   plan <- lhs.design(20,4,"optimum",
          factor.names=list(c(15,25), c(10,90), c(0,120), c(12,24)), digits=2)
   ## maximin design 
   plan2 <- lhs.design(20,4,"maximin",
          factor.names=list(c(15,25), c(10,90), c(0,120), c(12,24)), digits=2)
   ## purely random design (usually not ideal)
   plan3 <- lhs.design(20,4,"random",
          factor.names=list(c(15,25), c(10,90), c(0,120), c(12,24)), digits=2)
   ## genetic design 
   plan4 <- lhs.design(20,4,"genetic",
          factor.names=list(c(15,25), c(10,90), c(0,120), c(12,24)), digits=2)
   ## dmax design from package DiceDesign
   ## arguments range and niter_max are required
   ## ?dmaxDesign for more info
   plan5 <- lhs.design(20,4,"dmax",
        factor.names=list(torque=c(10,14),friction=c(25,35),
              temperature=c(-5,35),pressure=c(20,50)),digits=2,
              range=0.2, niter_max=500)
   ## Strauss design from package DiceDesign
   ## argument RND is required
   ## ?straussDesign for more info
   plan6 <- lhs.design(20,4,"strauss",
        factor.names=list(torque=c(10,14),friction=c(25,35),
              temperature=c(-5,35),pressure=c(20,50)),digits=2,
              RND = 0.2)
   ## compare all these designs
   compare(plan, plan2, plan3, plan4, plan5, plan6)
   


