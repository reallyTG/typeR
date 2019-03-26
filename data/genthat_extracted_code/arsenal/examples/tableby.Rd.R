library(arsenal)


### Name: tableby
### Title: Summary Statistics of a Set of Independent Variables by a
###   Categorical Variable
### Aliases: tableby

### ** Examples

data(mockstudy)
tab1 <- tableby(arm ~ sex + age, data=mockstudy)
summary(tab1, text=TRUE)

mylabels <- list(sex = "SEX", age ="Age, yrs")
summary(tab1, labelTranslations = mylabels, text=TRUE)

tab3 <- tableby(arm ~ sex + age, data=mockstudy, test=FALSE, total=FALSE,
                numeric.stats=c("median","q1q3"), numeric.test="kwt")
summary(tab3, text=TRUE)

# multiple LHS
summary(tableby(list(arm, sex) ~ age, data = mockstudy, strata = ps), text = TRUE)

tab.test <- tableby(arm ~ kwt(age) + anova(bmi) + kwt(ast), data=mockstudy)
tests(tab.test)




