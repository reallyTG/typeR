library(DoE.wrapper)


### Name: Dopt.design
### Title: Function for creating D-optimal designs with or without blocking
###   from package AlgDesign
### Aliases: Dopt.design
### Keywords: array design

### ** Examples

   ## a full quadratic model with constraint in three quantitative factors 
   plan <- Dopt.design(36,factor.names=list(eins=c(100,250),zwei=c(10,30),drei=c(-25,25)),
                          nlevels=c(4,3,6), 
                          formula=~quad(.), 
                          constraint="!(eins>=200 & zwei==30 & drei==25)")
   plan
   cor(plan)
   y <- rnorm(36)
   r.plan <- add.response(plan, y)
   plan2 <- Dopt.augment(r.plan, m=10)
   plot(plan2)
   cor(plan2)
   
   ## designs with qualitative factors and blocks for
   ## an experiment on assessing stories of social situations
   ## where each subject is a block and receives a deck of 5 stories
   plan.v <- Dopt.design(480, factor.names=list(cause=c("sick","bad luck","fault"), 
             consequences=c("alone","children","sick spouse"),
             gender=c("Female","Male"),
             Age=c("young","medium","old")),
             blocks=96,
             constraint="!(Age==\"young\" & consequences==\"children\")",
             formula=~.+cause:consequences+gender:consequences+Age:cause)
   ## an experiment on assessing stories of social situations
   ## with the whole block (=whole plot) factor gender of the assessor
   ##    not run for saving test time on CRAN
   ## Not run: 
##D plan.v.splitplot <- Dopt.design(480, factor.names=list(cause=c("sick","bad luck","fault"), 
##D              consequences=c("alone","children","sick spouse"),
##D              gender.story=c("Female","Male"),
##D              Age=c("young","medium","old")),
##D              blocks=96,
##D              wholeBlockData=cbind(gender=rep(c("Female","Male"),each=48)),
##D              constraint="!(Age==\"young\" & consequences==\"children\")",
##D              formula=~.+gender+cause:consequences+gender.story:consequences+
##D                  gender:consequences+Age:cause+gender:gender.story)
## End(Not run)



