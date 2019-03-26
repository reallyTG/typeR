library(phia)


### Name: testFactors
### Title: Evaluate and Test Combinations of Factor Levels
### Aliases: testFactors testFactors.default testFactors.lm testFactors.glm
###   testFactors.mlm testFactors.lme testFactors.mer testFactors.merMod
###   summary.testFactors

### ** Examples

# Example with factors and covariates
# Analyse prestige of Canadian occupations depending on
# education, income and type of occupation
# See ?Prestige for a description of the data set

prestige.mod <- lm(prestige ~ (education+log2(income))*type, data=Prestige)

# Pairwise comparisons for factor "type", to see how it influences
# the mean value of  prestige and interacts with log.income

# 1: "white collar" vs "blue collar"
wc.vs.bc <- list(type=c("wc", "bc"))
testFactors(prestige.mod, wc.vs.bc, terms.formula=~log2(income))
# 2: "professional" vs. "blue collar"
prof.vs.bc <- list(type=c("prof", "bc"))
testFactors(prestige.mod, prof.vs.bc, terms.formula=~log2(income))
# 3: "professional" vs. "white collar"
prof.vs.wc <- list(type=c("prof", "wc"))
testFactors(prestige.mod, prof.vs.wc, terms.formula=~log2(income))


# Interaction contrasts in a repeated-measures experiment
# See ?OBrienKaiser for a description of the data set

mod.ok <- lm(cbind(pre.1, pre.2, pre.3, pre.4, pre.5, 
  post.1, post.2, post.3, post.4, post.5, 
  fup.1, fup.2, fup.3, fup.4, fup.5) ~  treatment*gender, 
  data=OBrienKaiser)

# intra-subjects data:
phase <- factor(rep(c("pretest", "posttest", "followup"), each=5))
hour <- ordered(rep(1:5, 3))
idata <- data.frame(phase, hour)
Anova(mod.ok, idata=idata, idesign=~phase*hour)

# Contrasts across "phase", for different contrasts of "treatment"
# Using different definitions of the argument "levels"

# 1: Treatment "A" vs. treatment "B".
A.vs.B <- list(treatment=c("A", "B"))
# The following are equivalent:
# A.vs.B <- list(treatment=c(A=1, B=-1, control=0))
# A.vs.B <- list(treatment=c(A=1, B=-1))
# A.vs.B <- list(treatment ~ A - B)
# A.vs.B <- treatment ~ A - B
testFactors(mod.ok, A.vs.B, idata=idata, terms.formula=~0+phase)

# 2: Controls vs. treatments
control.vs.AB <- list(treatment=c(A=0.5, B=0.5, control=-1))
# The following is equivalent:
# control.vs.AB <- treatment ~ (A+B)/2 - control
testFactors(mod.ok, control.vs.AB, idata=idata, terms.formula=~0+phase)

# Shortcut to get only the adjusted values and simplified ANOVA tables
contr <- list(A.vs.B=A.vs.B, control.vs.AB=control.vs.AB)
anovaTables <- function(contrast) summary(testFactors(mod.ok, contrast,
  idata=idata, terms.formula=~0+phase),
  predictors=FALSE, matrices=FALSE)
  
lapply(contr,anovaTables)



