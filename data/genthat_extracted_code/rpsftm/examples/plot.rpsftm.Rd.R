library(rpsftm)


### Name: plot.rpsftm
### Title: Plot Method
### Aliases: plot.rpsftm

### ** Examples

fit <- rpsftm(Surv(progyrs, prog)~rand(imm,1-xoyrs/progyrs),immdef, censyrs)
plot(fit)
library(ggplot2)
plot(fit)+
   scale_linetype_discrete(labels=c("Control","Experimental"))+
   ylim(0.5,1)+
   geom_ribbon(aes(ymin=lower, ymax=upper, fill=group), alpha=0.3)+
   labs(x="Time (years)", title=NULL, lty="Arm", fill="Arm")



