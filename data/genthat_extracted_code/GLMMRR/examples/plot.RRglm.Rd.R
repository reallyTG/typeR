library(GLMMRR)


### Name: plot.RRglm
### Title: Plot diagnostics for a RRglm object
### Aliases: plot.RRglm

### ** Examples

out <- RRglm(response ~ Gender + RR + pp + age, link="RRlink.logit", RRmodel=RRmodel,
         p1=RRp1, p2=RRp2, data=Plagiarism, etastart=rep(0.01, nrow(Plagiarism)))
plot(out, which = 1:6, type = "deviance", ngroups = 50)



