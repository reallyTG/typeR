library(Hmisc)


### Name: nobsY
### Title: Compute Number of Observations for Left Hand Side of Formula
### Aliases: nobsY
### Keywords: utilities manip

### ** Examples

d <- expand.grid(sex=c('female', 'male', NA),
                 country=c('US', 'Romania'),
                 reps=1:2)
d$subject.id <- c(0, 0, 3:12)
dm <- addMarginal(d, sex, country)
dim(dm)
nobsY(sex + country ~ 1, data=d)
nobsY(sex + country ~ id(subject.id), data=d)
nobsY(sex + country ~ id(subject.id) + reps, group='reps', data=d)
nobsY(sex ~ 1, data=d)
nobsY(sex ~ 1, data=dm)
nobsY(sex ~ id(subject.id), data=dm)



