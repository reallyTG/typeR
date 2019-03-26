library(gmediation)


### Name: gmediate
### Title: Generalized Causal Mediation and Path Analysis
### Aliases: gmediate

### ** Examples

library(gmediation)

## mediation analysis for two stage mediators with one mediator at each stage
model.y1 <- glm(dmftd ~ ses + grpvlb + grpbpd + race + SEX + brush + seal, family = binomial,
                data = dental)
model.m11 <- glm(brush ~ ses + grpvlb + grpbpd + race + SEX, family = binomial, data = dental)
model.m21 <- glm(seal ~ ses + grpvlb + grpbpd + race + SEX + brush, family = binomial,
                 data = dental)
single <- gmediate(data = dental, model.m1 = list(model.m11), model.m2 = list(model.m21),
                   model.y = model.y1, expos = c("ses", 1), ref = c("ses", c(0,1)), seed = 1234,
                   bootsims = 100, cluster = NULL, decomp = 1, sig.level = 95, sens.par = c(0),
                   refmult = 1)
single
names(single)

## Not run: 
##D ## mediation analysis for two stage mediators with two mediator at each stage
##D model.y2 <- glm(dmftd ~ ses + grpvlb + grpbpd + race + SEX + brush + visit + seal + ohi,
##D                 family = binomial, data = dental)
##D model.m11 <- glm(brush ~ ses + grpvlb + grpbpd + race + SEX, family = binomial, data = dental)
##D model.m12 <- glm(visit ~ ses + grpvlb + grpbpd + race + SEX, family = binomial, data = dental)
##D model.m21 <- glm(seal ~ ses + grpvlb + grpbpd + race + SEX + brush + visit, family = binomial,
##D                  data = dental)
##D model.m22 <- glm(ohi ~ ses + grpvlb + grpbpd + race + SEX + brush + visit, family = gaussian,
##D                  data = dental)
##D gmediate(data = dental, model.m1 = list(model.m11,model.m12), model.m2 = list(model.m21,model.m22),
##D          model.y = model.y2, expos = c("ses", 1), ref = c("ses", c(0,1)), seed = 352,
##D          bootsims = 100, cluster = NULL, decomp = 2, sig.level = 95, sens.par = c(0,0.9),
##D          refmult = 2)
## End(Not run)




