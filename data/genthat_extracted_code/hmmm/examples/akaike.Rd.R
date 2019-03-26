library(hmmm)


### Name: akaike
### Title: akaike criterium
### Aliases: akaike
### Keywords: models

### ** Examples
data(madsen)
# 1 = Influence; 2 = Satisfaction;  3 = Contact; 4 = Housing 
names<-c("Inf","Sat","Co","Ho")
y<-getnames(madsen,st=6)

margin <- marg.list(c("marg-marg-l-l", "g-marg-l-l", "marg-g-l-l", "g-g-l-l"))

# additive effect of 3 and 4 on logits of 1 in marginal  
# distribution {1, 3, 4}, conditional independence 2_||_3|4 
modelA <- hmmm.model(marg = margin, lev = c(3, 3, 2, 4), names = names)
modA <- hmmm.mlfit(y, modelA)
modA

# additive effect of 3 and 4 on logits of 1 in marginal
# distributions {1, 3, 4} and {2, 3, 4}
modelB <- hmmm.model(marg = margin, lev = c(3, 3, 2, 4),
names = names, sel = c(18:23, 34:39))
modB <- hmmm.mlfit(y, modelB)
modB

# 1 and 2 do not depend on the levels of 3 and 4
modelC <- hmmm.model(marg = margin, lev = c(3, 3, 2, 4),
names = names, sel = c(18:23, 34:39, 44:71))
modC <- hmmm.mlfit(y, modelC)
modC

akaike(modB, modA, modC, ORDERED = TRUE, NAMES = c("modB", "modA", "modC"))
akaike(modB, modA, modC, LRTEST = TRUE, NAMES = c("modB", "modA", "modC"))


