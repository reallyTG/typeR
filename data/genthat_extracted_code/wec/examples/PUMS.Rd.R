library(wec)


### Name: PUMS
### Title: Public Use Microdata Sample files (PUMS) 2013
### Aliases: PUMS
### Keywords: datasets

### ** Examples


data(PUMS)

PUMS$race.wec <- factor(PUMS$race)
contrasts(PUMS$race.wec) <- contr.wec(PUMS$race.wec, "White")
contrasts(PUMS$race.wec)

m.wec <- lm(wage ~ race.wec, data=PUMS)
summary(m.wec)

PUMS$race.educint <- wec.interact(PUMS$race.wec, PUMS$education.int)
m.wec.educ <- lm(wage ~ race.wec + education.int + race.educint, data=PUMS)
summary(m.wec.educ)




