library(AICcmodavg)


### Name: lizards
### Title: Habitat Preference of Lizards
### Aliases: lizards
### Keywords: datasets

### ** Examples

data(lizards)
## Not run: 
##D ##log-linear model as in Burnham and Anderson 2002, p. 137
##D ##main effects
##D m1 <- glm(Counts ~ Insolation + Diameter + Height + Time + Species, 
##D           family = poisson, data = lizards)
##D 
##D 
##D ##main effects and all second order interactions = base
##D m2 <- glm(Counts ~ Insolation + Diameter + Height + Time + Species +
##D           Insolation:Diameter + Insolation:Height + Insolation:Time +
##D           Insolation:Species + Diameter:Height + Diameter:Time +
##D           Diameter:Species + Height:Time + Height:Species +
##D           Time:Species, family = poisson, data = lizards)
##D 
##D ##base - DT
##D m3 <- glm(Counts ~ Insolation + Diameter + Height + Time + Species +
##D           Insolation:Diameter + Insolation:Height + Insolation:Time +
##D           Insolation:Species + Diameter:Height + Diameter:Species +
##D           Height:Time + Height:Species + Time:Species, 
##D           family = poisson, data = lizards)
##D 
##D ##base + HDI + HDT + HDS
##D m4 <- glm(Counts ~ Insolation + Diameter + Height + Time + Species +
##D           Insolation:Diameter + Insolation:Height + Insolation:Time +
##D           Insolation:Species + Diameter:Height + Diameter:Time +
##D           Diameter:Species + Height:Time + Height:Species +
##D           Time:Species + Height:Diameter:Insolation +
##D           Height:Diameter:Time + Height:Diameter:Species, 
##D           family = poisson, data = lizards)
##D 
##D ##base + HDI + HDS + HIT + HIS + HTS + ITS
##D m5 <- glm(Counts ~ Insolation + Diameter + Height + Time + Species + 
##D           Insolation:Diameter + Insolation:Height + Insolation:Time +
##D           Insolation:Species + Diameter:Height + Diameter:Time +
##D           Diameter:Species + Height:Time + Height:Species +
##D           Time:Species + Height:Diameter:Insolation +
##D           Height:Diameter:Species + Height:Insolation:Time +
##D           Height:Insolation:Species + Height:Time:Species +
##D           Insolation:Time:Species, family = poisson, data = lizards)
##D 
##D ##base + HIT + HIS + HTS + ITS
##D m6 <- glm(Counts ~ Insolation + Diameter + Height + Time + Species + 
##D           Insolation:Diameter + Insolation:Height + Insolation:Time +
##D           Insolation:Species + Diameter:Height + Diameter:Time +
##D           Diameter:Species + Height:Time + Height:Species +
##D           Time:Species + Height:Insolation:Time +
##D           Height:Insolation:Species +  Height:Time:Species +
##D           Insolation:Time:Species,  family = poisson, data = lizards)
##D 
##D ##base + HIS + HTS + ITS
##D m7 <- glm(Counts ~ Insolation + Diameter + Height + Time + Species +
##D           Insolation:Diameter + Insolation:Height + Insolation:Time +
##D           Insolation:Species + Diameter:Height + Diameter:Time +
##D           Diameter:Species + Height:Time + Height:Species +
##D           Time:Species + Height:Insolation:Species +
##D           Height:Time:Species + Insolation:Time:Species, 
##D           family = poisson, data = lizards)
##D 
##D ##base + HIT + HIS + HTS + ITS - DT
##D m8 <- glm(Counts ~ Insolation + Diameter + Height + Time + Species +
##D           Insolation:Diameter + Insolation:Height + Insolation:Time +
##D           Insolation:Species + Diameter:Height + Diameter:Species +
##D           Height:Time + Height:Species + Time:Species +
##D           Height:Insolation:Time + Height:Insolation:Species +
##D           Height:Time:Species + Insolation:Time:Species, 
##D           family = poisson, data = lizards)
##D 
##D ##base + HIT + HIS + ITS - DT
##D m9 <- glm(Counts ~ Insolation + Diameter + Height + Time + Species +
##D           Insolation:Diameter + Insolation:Height + Insolation:Time +
##D           Insolation:Species + Diameter:Height + Diameter:Species +
##D           Height:Time + Height:Species + Time:Species +
##D           Height:Insolation:Time + Height:Insolation:Species +
##D           Insolation:Time:Species, 
##D           family = poisson, data = lizards)
##D 
##D ##base + HIT + HIS - DT
##D m10 <- glm(Counts ~ Insolation + Diameter + Height + Time + Species +
##D           Insolation:Diameter + Insolation:Height + Insolation:Time +
##D           Insolation:Species + Diameter:Height + Diameter:Species +
##D           Height:Time + Height:Species + Time:Species +
##D           Height:Insolation:Time + Height:Insolation:Species,
##D           family = poisson, data = lizards)
##D 
##D ##set up in list
##D Cands <- list(m1, m2, m3, m4, m5, m6, m7, m8, m9, m10)
##D Modnames <- paste("m", 1:length(Cands), sep = "")
##D 
##D ##model selection
##D library(AICcmodavg)
##D aictab(Cands, Modnames)
## End(Not run)



