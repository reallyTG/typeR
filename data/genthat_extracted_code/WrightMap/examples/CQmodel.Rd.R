library(WrightMap)


### Name: CQmodel
### Title: ConQuest Output Processing
### Aliases: CQmodel print.CQmodel print.SOE

### ** Examples

	
fpath <- system.file("extdata", package="WrightMap")

# Partial credit model
model1 <- CQmodel(p.est = file.path(fpath,"ex2.eap"), 
show = file.path(fpath,"ex2.shw")) 
model1 #Shows what tables are available

model1$SOE #Summary of estimation
model1$equation # Model specification
model1$reg.coef # Regression coefficients
model1$rel.coef # Reliability coefficients
model1$variances # Variances

names(model1$RMP) # Names of parameter tables
head(model1$RMP$item) #Item parameters
head(model1$RMP$"item*step") #Item by step parameters

# Complex model
model2 <- CQmodel(file.path(fpath,"ex4a.mle"), 
file.path(fpath,"ex4a.shw")) 
model2$equation # Model specification
names(model2$RMP) # Names of parameter tables
head(model2$RMP$"rater*topic*criteria*step") #An interaction table

model1$GIN #Item thresholds
model2$GIN #Item thresholds

head(model1$p.est)  ##EAPs
head(model2$p.est)  ##MLEs




