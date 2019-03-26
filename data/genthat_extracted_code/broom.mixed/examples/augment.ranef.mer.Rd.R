library(broom.mixed)


### Name: augment.ranef.mer
### Title: Augmentation for random effects (for caterpillar plots etc.)
### Aliases: augment.ranef.mer

### ** Examples

if (require("lme4")) {
   load(system.file("extdata","lme4_example.rda",package="broom.mixed"))
   rr <- ranef(lmm1,condVar=TRUE)
   aa <- broom::augment(rr)
   ## Q-Q plot:
   if (require(ggplot2) && require(dplyr)) {
      g0 <- ggplot(aa,aes(estimate,qq,xmin=lb,xmax=ub))+
          geom_errorbarh(height=0)+
          geom_point()+facet_wrap(~variable,scale="free_x")
      ## regular caterpillar plot:
      g1 <- ggplot(aa,aes(estimate,level,xmin=lb,xmax=ub))+
         geom_errorbarh(height=0)+
         geom_vline(xintercept=0,lty=2)+
         geom_point()+facet_wrap(~variable,scale="free_x")
      ## emphasize extreme values
      aa2 <- group_by(aa,grp,level)
      aa3 <- mutate(aa2, keep=any(estimate/std.error>2))
      ## Update caterpillar plot with extreme levels highlighted
      ##  (highlight all groups with *either* extreme intercept *or*
      ##   extreme slope)
      ggplot(aa3, aes(estimate,level,xmin=lb,xmax=ub,colour=factor(keep)))+
         geom_errorbarh(height=0)+
         geom_vline(xintercept=0,lty=2)+
         geom_point()+facet_wrap(~variable,scale="free_x")+
         scale_colour_manual(values=c("black","red"), guide=FALSE)
   }
}



