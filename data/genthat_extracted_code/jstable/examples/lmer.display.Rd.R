library(jstable)


### Name: lmer.display
### Title: lmer.display: table for "lmerMod" or "glmerMod" object (lme4
###   package)
### Aliases: lmer.display

### ** Examples

 library(geepack)
 data(dietox)
 dietox$Cu <- as.factor(dietox$Cu)
 l1 <- lme4::lmer(Weight ~ Time + Cu + (1|Pig) + (1|Evit), data = dietox)
 lmer.display(l1)



