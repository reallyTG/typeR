library(SASmixed)


### Name: Multilocation
### Title: A multilocation trial
### Aliases: Multilocation
### Keywords: datasets

### ** Examples

str(Multilocation)
if (require("lme4", quietly = TRUE, character = TRUE)) {
  options(contrasts = c(unordered = "contr.SAS", ordered = "contr.poly"))
  ### Create a Block %in% Location factor
  Multilocation$Grp <- with(Multilocation, Block:Location)
  print(fm1Mult <- lmer(Adj ~ Location * Trt + (1|Grp), Multilocation))
  print(anova(fm1Mult))
  print(fm2Mult <- lmer(Adj ~ Location + Trt + (1|Grp), Multilocation), corr=FALSE)
  print(fm3Mult <- lmer(Adj ~ Location + (1|Grp), Multilocation), corr=FALSE)
  print(fm4Mult <- lmer(Adj ~ Trt + (1|Grp), Multilocation))
  print(fm5Mult <- lmer(Adj ~ 1 + (1|Grp), Multilocation))
  print(anova(fm2Mult))
  print(anova(fm1Mult, fm2Mult, fm3Mult, fm4Mult, fm5Mult))
  ### Treating the location as a random effect
  print(fm1MultR <- lmer(Adj ~ Trt + (1|Location/Trt) + (1|Grp), Multilocation))
  print(anova(fm1MultR))
  fm2MultR <- lmer(Adj ~ Trt + (Trt - 1|Location) + (1|Block), Multilocation)
  ## Warning (not error ?!): Convergence failure in 10000 iter %% __FIXME__
  print(fm2MultR)# does not mention previous conv.failure %% FIXME ??
  print(anova(fm1MultR, fm2MultR))
 ## Not run: 
##D   confint(fm1MultR)##D 
##D  
## End(Not run)
}



