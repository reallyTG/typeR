library(mosaic)


### Name: mean_
### Title: Aggregating functions
### Aliases: mean_ sum min max mean median sd var cov cor favstats range
###   IQR fivenum iqr prod quantile

### ** Examples

mean(HELPrct$age)
mean( ~ age, data = HELPrct)
mean( ~ drugrisk, na.rm = TRUE, data = HELPrct)
mean(age ~ shuffle(sex), data = HELPrct)
mean(age ~ shuffle(sex), data = HELPrct, .format = "table")
# wrap in data.frame() to auto-convert awkward variable names
data.frame(mean(age ~ shuffle(sex), data = HELPrct, .format = "table"))
mean(age ~ sex + substance, data = HELPrct)
mean( ~ age | sex + substance, data = HELPrct)
mean( ~ sqrt(age), data = HELPrct)
sum( ~ age, data = HELPrct)
sd(HELPrct$age)
sd( ~ age, data = HELPrct)
sd(age ~ sex + substance, data = HELPrct)
var(HELPrct$age)
var( ~ age, data = HELPrct)
var(age ~ sex + substance, data = HELPrct)
IQR(width ~ sex, data = KidsFeet)
iqr(width ~ sex, data = KidsFeet)
favstats(width ~ sex, data = KidsFeet)

cor(length ~ width, data = KidsFeet)
cov(length ~ width, data = KidsFeet)
tally(is.na(mcs) ~ is.na(pcs), data = HELPmiss)
cov(mcs ~ pcs, data = HELPmiss)             # NA because of missing data
cov(mcs ~ pcs, data = HELPmiss, use = "complete")  # ignore missing data
# alternative approach using filter explicitly
cov(mcs ~ pcs, data = HELPmiss %>% filter(!is.na(mcs) & !is.na(pcs)))    



