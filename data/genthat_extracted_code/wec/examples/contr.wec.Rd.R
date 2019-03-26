library(wec)


### Name: contr.wec
### Title: Function calculates contrasts for a factor variable based on
###   weighted effect coding.
### Aliases: contr.wec
### Keywords: classes category manip

### ** Examples


data(BMI)


# Without controls
BMI$educ.wec.lowest <- BMI$educ.wec.highest <- BMI$educ

contrasts(BMI$educ.wec.lowest) <- contr.wec(BMI$education, omitted="lowest")
contrasts(BMI$educ.wec.highest) <- contr.wec(BMI$education, omitted="highest")

model.wec.lowest <- lm(BMI ~ educ.wec.lowest, data=BMI)
model.wec.highest <- lm(BMI ~ educ.wec.highest, data=BMI)
summary(model.wec.lowest)
summary(model.wec.highest)

# With Controls
BMI$sex.wec.female <- BMI$sex.wec.male <- BMI$sex
contrasts(BMI$sex.wec.female) <- contr.wec(BMI$sex, omitted="female")
contrasts(BMI$sex.wec.male) <- contr.wec(BMI$sex, omitted="male")

BMI$year.wec.2000 <- BMI$year.wec.2011 <- BMI$year
contrasts(BMI$year.wec.2000) <- contr.wec(BMI$year, omitted="2000")
contrasts(BMI$year.wec.2011) <- contr.wec(BMI$year, omitted="2011")

model.wec.lowest.controls <- lm(BMI ~ educ.wec.lowest +
  sex.wec.female + log_age + year.wec.2000,
  data=BMI)
model.wec.highest.controls <- lm(BMI ~ educ.wec.highest +
  sex.wec.male + log_age + year.wec.2011,
  data=BMI)
summary(model.wec.lowest.controls)
summary(model.wec.highest.controls)



