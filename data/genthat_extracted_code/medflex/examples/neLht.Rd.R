library(medflex)


### Name: neLht
### Title: Linear hypotheses for natural effect models
### Aliases: neLht neEffdecomp neEffdecomp.neModel neLht.neModel

### ** Examples

data(UPBdata)

impData <- neImpute(UPB ~ att * negaff + gender + educ + age, 
                    family = binomial, data = UPBdata)
neMod <- neModel(UPB ~ att0 * att1 + gender + educ + age, 
                 family = binomial, expData = impData, se = "robust")

lht <- neLht(neMod, linfct = c("att0 = 0", "att0 + att0:att1 = 0", 
                               "att1 = 0", "att1 + att0:att1 = 0", 
                               "att0 + att1 + att0:att1 = 0"))
summary(lht)

## or obtain directly via neEffdecomp
eff <- neEffdecomp(neMod)
summary(eff)

## changing reference levels for multicategorical exposures
UPBdata$attcat <- factor(cut(UPBdata$att, 3), labels = c("L", "M", "H"))
impData <- neImpute(UPB ~ attcat * negaff + gender + educ + age,
                    family = binomial, data = UPBdata)
neMod <- neModel(UPB ~ attcat0 * attcat1 + gender + educ + age,
                 family = binomial, expData = impData, se = "robust")
                 
neEffdecomp(neMod)
neEffdecomp(neMod, xRef = c("L", "H"))
neEffdecomp(neMod, xRef = c("M", "H"))


## changing reference levels for continuous exposures
impData <- neImpute(UPB ~ (att + I(att^2)) * negaff + gender + educ + age,
                    family = binomial, data = UPBdata)
neMod <- neModel(UPB ~ (att0 + I(att0^2)) * (att1 + I(att1^2)) + gender + educ + age,
                 family = binomial, expData = impData, se = "robust")
neEffdecomp(neMod)
neEffdecomp(neMod, xRef = c(-1, 0))

## changing covariate levels when allowing for modification 
## of the indirect effect by baseline covariates
impData <- neImpute(UPB ~ (att + negaff + gender + educ + age)^2,
                    family = binomial, data = UPBdata)
neMod <- neModel(UPB ~ att0 * att1 + gender + educ + age + att1:gender + att1:age,
                 family = binomial, expData = impData, se = "robust")
neEffdecomp(neMod)
neEffdecomp(neMod, covLev = c(gender = "F", age = 0)) # default covariate levels
neEffdecomp(neMod, covLev = c(gender = "M", age = 40))
neEffdecomp(neMod, covLev = c(gender = "M", age = 40, educ = "L"))
neEffdecomp(neMod, covLev = c(gender = "M", age = 40, educ = "M"))
neEffdecomp(neMod, covLev = c(gender = "M", age = 40, educ = "H"))
# effect decomposition is independent of education level
neEffdecomp(neMod, covLev = c(gender = "M")) 
# age is set to its default level when left unspecified




