library(lme4)


### Name: confint.merMod
### Title: Compute Confidence Intervals for Parameters of a [ng]lmer Fit
### Aliases: confint.merMod confint.thpr

### ** Examples

fm1 <- lmer(Reaction ~ Days + (Days|Subject), sleepstudy)
fm1W <- confint(fm1, method="Wald")# very fast, but ....
fm1W
(fm2 <- lmer(Reaction ~ Days + (Days || Subject), sleepstudy))
(CI2 <- confint(fm2, maxpts = 8)) # method = "profile"; 8: to be much faster
## Don't show: 
 stopifnot(all.equal(tolerance = 5e-6, signif(unname(CI2), 7),
               array(c(15.25847, 3.964157, 22.88062, 237.5732,  7.33431,
                       37.78184, 8.768238, 28.78768, 265.2383, 13.60057),
                     dim = c(5L, 2L))))
## End(Don't show)
testLevel <- if (nzchar(s <- Sys.getenv("LME4_TEST_LEVEL"))) as.numeric(s) else 1
if(interactive() || testLevel >= 3) {
 ## ~20 seconds, MacBook Pro laptop
 system.time(fm1P <- confint(fm1, method="profile", ## default
                             oldNames = FALSE))
 ## ~ 40 seconds
 system.time(fm1B <- confint(fm1, method="boot",
                             .progress="txt", PBargs=list(style=3)))
} else
  load(system.file("testdata","confint_ex.rda",package="lme4"))
fm1P
fm1B



