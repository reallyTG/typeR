library(GLMMRR)


### Name: plot.RRglmerMod
### Title: Plot diagnostics for a RRglmerMod object
### Aliases: plot.RRglmerMod

### ** Examples

out <- RRglmer(response ~ Gender + RR + pp + (1+pp|age), link="RRlink.logit", RRmodel=RRmodel,
         p1=RRp1, p2=RRp2, data=Plagiarism, na.action = "na.omit",
         etastart = rep(0.01, nrow(Plagiarism)),
         control = glmerControl(optimizer = "Nelder_Mead", tolPwrss = 1e-03), nAGQ = 1)
plot(out, which = 1:5)



