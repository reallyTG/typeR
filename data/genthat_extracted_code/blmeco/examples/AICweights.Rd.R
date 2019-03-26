library(blmeco)


### Name: AICweights
### Title: Calculates AICc-weights for each model of a set of models
### Aliases: AICweights
### Keywords: model misc

### ** Examples

data(periparusater)
dat<-periparusater
# preparation of the data
dat$age[dat$age==0] <- NA  # replace 0 with NA
dat$age[dat$age==5] <- 4   # replace "after hatching year" with "non-hatching year"
dat$age <- factor(dat$age) # 3 = hatching year, 4 = non hatching year
dat$sex[dat$sex==0] <- NA  # replace 0 by missing values
dat$sex <- factor(dat$sex) # 1 = males, 2 = females
# retain only those data where sex and age is not missing
dat <- dat[complete.cases(dat$sex, dat$age),] 


mod1 <- lm(wing~sex+age, data=dat)
mod2 <- lm(wing~sex*age, data=dat)
AICweights(c("mod1", "mod2"))





