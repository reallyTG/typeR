library(wec)


### Name: wec.interact
### Title: Function to create an interaction between two variables based on
###   weighted effect coding.
### Aliases: wec.interact
### Keywords: classes category manip

### ** Examples

data(BMI)

# Interaction two weighted effect coded categorical variables
BMI$childless.wec.yes <- BMI$childless.wec.no <- BMI$childless
contrasts(BMI$childless.wec.yes) <- contr.wec(BMI$childless, omitted="yes")
contrasts(BMI$childless.wec.no) <- contr.wec(BMI$childless, omitted="no")

BMI$age.wec.young <- BMI$age.wec.older <- BMI$age
contrasts(BMI$age.wec.young) <- contr.wec(BMI$age_categorical, omitted="Young (18-30)")
contrasts(BMI$age.wec.older) <- contr.wec(BMI$age_categorical, omitted="Older (60-70)")

model3a <- lm(BMI ~ childless.wec.yes + age.wec.young, data=BMI)
model3b <- lm(BMI ~ childless.wec.no + age.wec.older, data=BMI)
summary(model3a)
summary(model3b)


# Interaction
BMI$interact_c <- wec.interact(BMI$childless.wec.yes, BMI$age.wec.young)
BMI$interact_d <- wec.interact(BMI$childless.wec.yes, BMI$age.wec.older)
BMI$interact_e <- wec.interact(BMI$childless.wec.no, BMI$age.wec.young)
BMI$interact_f <- wec.interact(BMI$childless.wec.no, BMI$age.wec.older)

model3c <- lm(BMI ~ childless.wec.yes + age.wec.young + interact_c, data=BMI)
model3d <- lm(BMI ~ childless.wec.yes + age.wec.older + interact_d, data=BMI)
model3e <- lm(BMI ~ childless.wec.no + age.wec.young + interact_e, data=BMI)
model3f <- lm(BMI ~ childless.wec.no + age.wec.older + interact_f, data=BMI)

summary(model3c)
summary(model3d)
summary(model3e)
summary(model3f)


# Interaction weighted effect coded categorical variable and ratio/interval variable

data(PUMS)


PUMS$race.wec <- factor(PUMS$race)
contrasts(PUMS$race.wec) <- contr.wec(PUMS$race.wec, "White")
contrasts(PUMS$race.wec)

m.wec <- lm(wage ~ race.wec, data=PUMS)
summary(m.wec)

PUMS$race.educint <- wec.interact(PUMS$race.wec, PUMS$education.int)
m.wec.educ <- lm(wage ~ race.wec + education.int + race.educint, data=PUMS)
summary(m.wec.educ)




