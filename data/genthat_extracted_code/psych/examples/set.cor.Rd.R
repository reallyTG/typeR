library(psych)


### Name: setCor
### Title: Multiple Regression and Set Correlation from matrix or raw input
### Aliases: setCor setCor.diagram set.cor mat.regress matReg
### Keywords: models multivariate

### ** Examples

#First compare to lm using data input
summary(lm(rating ~ complaints + privileges, data = attitude))
setCor(rating ~ complaints + privileges, data = attitude, std=FALSE) #do not standardize
z.attitude <- data.frame(scale(attitude))  #standardize
summary(lm(rating ~ complaints + privileges, data = z.attitude))  #regressions on z scores
setCor(rating ~ complaints + privileges, data = z.attitude)  #by default we standardize

R <- cor(attitude) #find the correlations
#Do the regression on the correlations  
#Note that these match the regressions on the standard scores of the data
setCor(rating ~ complaints + privileges, data =R, n.obs=30)

#now, partial out learning and critical
setCor(rating ~ complaints + privileges - learning - critical, data =R, n.obs=30)
#compare with the full regression:
setCor(rating ~ complaints + privileges + learning + critical, data =R, n.obs=30)
#Canonical correlations:

#The first Kelley data set from Hotelling
kelley1 <- structure(c(1, 0.6328, 0.2412, 0.0586, 0.6328, 1, -0.0553, 0.0655, 
0.2412, -0.0553, 1, 0.4248, 0.0586, 0.0655, 0.4248, 1), .Dim = c(4L, 
4L), .Dimnames = list(c("reading.speed", "reading.power", "math.speed", 
"math.power"), c("reading.speed", "reading.power", "math.speed", 
"math.power")))
lowerMat(kelley1)
mod1 <- setCor(y = math.speed + math.power ~ reading.speed + reading.power, 
    data = kelley1, n.obs=140)
mod1$cancor
#Hotelling reports .3945 and .0688  we get  0.39450592 0.06884787

#the second Kelley data from Hotelling
kelley <- structure(list(speed = c(1, 0.4248, 0.042, 0.0215, 0.0573), power = c(0.4248, 
1, 0.1487, 0.2489, 0.2843), words = c(0.042, 0.1487, 1, 0.6693, 
0.4662), symbols = c(0.0215, 0.2489, 0.6693, 1, 0.6915), meaningless = c(0.0573, 
0.2843, 0.4662, 0.6915, 1)), .Names = c("speed", "power", "words", 
"symbols", "meaningless"), class = "data.frame", row.names = c("speed", 
"power", "words", "symbols", "meaningless"))

lowerMat(kelley)

setCor(power + speed ~ words + symbols + meaningless,data=kelley)  #formula mode
#setCor(y= 1:2,x = 3:5,data = kelley) #order of variables input

#Hotelling reports canonical correlations of .3073 and .0583  or squared correlations of
# 0.09443329 and 0.00339889 vs. our values of cancor = 0.3076 0.0593  with squared values
#of  0.0946 0.0035,

setCor(y=c(7:9),x=c(1:6),data=Thurstone,n.obs=213)  #easier to just list variable  
                                              #locations if we have long names
#now try partialling out some variables
set.cor(y=c(7:9),x=c(1:3),z=c(4:6),data=Thurstone) #compare with the previous
#compare complete print out with summary printing 
sc <- setCor(SATV + SATQ ~ gender + education,data=sat.act) # regression from raw data
sc
summary(sc)

setCor(Pedigrees ~ Sentences + Vocabulary - First.Letters - Four.Letter.Words ,
data=Thurstone)  #showing formula input with two covariates

#Do some regressions with real data 
setCor(reaction ~ cond + pmi + import, data = Tal.Or)
#partial out importance
setCor(reaction ~ cond + pmi - import, data = Tal.Or, main="Partial out importance")
#compare with using lm by partialling
mod1 <- lm(reaction ~ cond + pmi + import, data = Tal.Or)
reaction.import <- lm(reaction~import,data=Tal.Or)$resid
cond.import <-  lm(cond~import,data=Tal.Or)$resid
pmi.import <-   lm(pmi~import,data=Tal.Or)$resid
mod.partial <- lm(reaction.import ~ cond.import + pmi.import)
summary(mod.partial)
#lm uses raw scores, so set std = FALSE for setCor
print(setCor(y = reaction ~ cond + pmi - import, data = Tal.Or,std = FALSE,
 main = "Partial out importance"),digits=4)
 
 #Show how to find quadratic terms
sc <- setCor(reaction ~ cond + pmi + I(import^2), data = Tal.Or)
sc
#pairs.panels(sc$data) #show the SPLOM of the data



