library(plm)


### Name: detect_lin_dep
### Title: Functions to detect linear dependence
### Aliases: detect_lin_dep detect_lin_dep.matrix detect_lin_dep.data.frame
###   detect_lin_dep.plm alias alias.plm alias.pFormula
### Keywords: manip array

### ** Examples

### Example 1 ###
# prepare the data
data("Cigar" , package = "plm")
Cigar[ , "fact1"] <- c(0,1)
Cigar[ , "fact2"] <- c(1,0)
Cigar.p <- pdata.frame(Cigar)

# setup a pFormula and a model frame
pform <- pFormula(price ~ 0 + cpi + fact1 + fact2)
mf <- model.frame(pform, data = Cigar.p)

# no linear dependence in the pooling model's model matrix
# (with intercept in the formula, there would be linear depedence)
detect_lin_dep(model.matrix(pform, data = mf, model = "pooling"))

# linear dependence present in the FE transformed model matrix
modmat_FE <- model.matrix(pform, data = mf, model = "within")
detect_lin_dep(modmat_FE)
mod_FE <- plm(pform, data = Cigar.p, model = "within")
detect_lin_dep(mod_FE) 
alias(mod_FE) # => fact1 == -1*fact2
plm(pform, data = mf, model = "within")$aliased # "fact2" indicated as aliased

# look at the data: after FE transformation fact1 == -1*fact2
head(modmat_FE)
all.equal(modmat_FE[ , "fact1"], -1*modmat_FE[ , "fact2"])

### Example 2 ###
# Setup the data:
# Assume CEOs stay with the firms of the Grunfeld data
# for the firm's entire lifetime and assume some fictional
# data about CEO tenure and age in year 1935 (first observation
# in the data set) to be at 1 to 10 years and 38 to 55 years, respectively.
# => CEO tenure and CEO age increase by same value (+1 year per year).
data(Grunfeld, package = "plm")
set.seed(42)
# add fictional data
Grunfeld$CEOtenure <- c(replicate(10, seq(from=s<-sample(1:10,  1), to=s+19, by=1)))
Grunfeld$CEOage    <- c(replicate(10, seq(from=s<-sample(38:65, 1), to=s+19, by=1)))

# look at the data
head(Grunfeld, 50)

pform <- pFormula(inv ~ value + capital + CEOtenure + CEOage)
mf <- model.frame(pform, data=pdata.frame(Grunfeld))

# no linear dependent columns in original data/pooling model
modmat_pool <- model.matrix(pform, data = mf, model="pooling")
detect_lin_dep(modmat_pool)
mod_pool <- plm(pform, data = Grunfeld, model = "pooling")
alias(mod_pool)

# CEOtenure and CEOage are linear dependent after FE transformation
# (demeaning per individual)
modmat_FE <- model.matrix(pform, data = mf, model="within")
detect_lin_dep(modmat_FE)
mod_FE <- plm(pform, data = Grunfeld, model = "within")
detect_lin_dep(mod_FE)
alias(mod_FE)

# look at the transformed data: after FE transformation CEOtenure == 1*CEOage
head(modmat_FE, 50)
all.equal(modmat_FE[ , "CEOtenure"], modmat_FE[ , "CEOage"])



