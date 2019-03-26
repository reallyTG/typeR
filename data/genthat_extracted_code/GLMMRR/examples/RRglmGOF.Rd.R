library(GLMMRR)


### Name: RRglmGOF
### Title: Goodness-of-fit statistics for binary Randomized Response data
### Aliases: RRglmGOF

### ** Examples

out <- RRglm(response ~ Gender + RR + pp + age, link="RRlink.logit", RRmodel=RRmodel,
         p1=RRp1, p2=RRp2, data=Plagiarism, etastart=rep(0.01, nrow(Plagiarism)))
RRglmGOF(RRglmOutput = out, doPearson = TRUE, doDeviance = TRUE, doHlemeshow = TRUE, print = TRUE)



