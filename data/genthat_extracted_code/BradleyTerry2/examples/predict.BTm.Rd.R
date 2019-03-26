library(BradleyTerry2)


### Name: predict.BTm
### Title: Predict Method for Bradley-Terry Models
### Aliases: predict.BTm
### Keywords: models

### ** Examples


## The final model in example(flatlizards)
result <- rep(1, nrow(flatlizards$contests))
Whiting.model3 <- BTm(1, winner, loser, ~ throat.PC1[..] + throat.PC3[..] +
                      head.length[..] + SVL[..] + (1|..),
                      family = binomial(link = "probit"),
                      data = flatlizards, trace = TRUE)

## `new' data for contests between four of the original lizards
## factor levels must correspond to original levels, but unused levels
## can be dropped - levels must match rows of predictors
newdata  <- list(contests = data.frame(
                 winner = factor(c("lizard048", "lizard060"),
                 levels = c("lizard006", "lizard011", 
                            "lizard048", "lizard060")),
                 loser = factor(c("lizard006", "lizard011"),
                 levels = c("lizard006", "lizard011", 
                            "lizard048", "lizard060"))
                 ),
                 predictors = flatlizards$predictors[c(3, 6, 27, 33), ])

predict(Whiting.model3, level = 1, newdata = newdata)

## same as
predict(Whiting.model3, level = 1)[1:2]

## introducing a new lizard
newpred <- rbind(flatlizards$predictors[c(3, 6, 27),
                     c("throat.PC1","throat.PC3", "SVL", "head.length")],
                 c(-5, 1.5, 1, 0.1))
rownames(newpred)[4] <- "lizard059"

newdata  <- list(contests = data.frame(
                 winner = factor(c("lizard048", "lizard059"),
                 levels = c("lizard006", "lizard011", 
                            "lizard048", "lizard059")),
                 loser = factor(c("lizard006", "lizard011"),
                 levels = c("lizard006", "lizard011", 
                            "lizard048", "lizard059"))
                 ),
                 predictors = newpred)

## can only predict at population level for contest with new lizard
predict(Whiting.model3, level = 0:1, se.fit = TRUE, newdata = newdata)

## predicting at specific levels of covariates

## consider a model from example(CEMS)
table6.model <-  BTm(outcome = cbind(win1.adj, win2.adj),
                     player1 = school1, player2 = school2,
                     formula = ~ .. +
                         WOR[student] * Paris[..] +
                         WOR[student] * Milano[..] +
                         WOR[student] * Barcelona[..] +
                         DEG[student] * St.Gallen[..] +
                         STUD[student] * Paris[..] +
                         STUD[student] * St.Gallen[..] +
                         ENG[student] * St.Gallen[..] +
                         FRA[student] * London[..] +
                         FRA[student] * Paris[..] +
                         SPA[student] * Barcelona[..] +
                         ITA[student] * London[..] +
                         ITA[student] * Milano[..] +
                         SEX[student] * Milano[..],
                     refcat = "Stockholm",
                     data = CEMS)
                     
## estimate abilities for a combination not seen in the original data

## same schools
schools <- levels(CEMS$preferences$school1)
## new student data
students <- data.frame(STUD = "other", ENG = "good", FRA = "good", 
                       SPA = "good", ITA = "good", WOR = "yes", DEG = "no",
                       SEX = "female", stringsAsFactors = FALSE)
## set levels to be the same as original data    
for (i in seq_len(ncol(students))){
    students[,i] <- factor(students[,i], levels(CEMS$students[,i]))
}
newdata <- list(preferences = 
    data.frame(student = factor(500), # new id matching with `students[1,]`
               school1 = factor("London", levels = schools),
               school2 = factor("Paris", levels = schools)),
    students = students,
    schools = CEMS$schools)

## warning can be ignored as model specification was over-parameterized
predict(table6.model, newdata = newdata)

## if treatment contrasts are use (i.e. one player is set as the reference
## category), then predicting the outcome of contests against the reference
## is equivalent to estimating abilities with specific covariate values

## add student with all values at reference levels 
students <- rbind(students,
    data.frame(STUD = "other", ENG = "good", FRA = "good", 
               SPA = "good", ITA = "good", WOR = "no", DEG = "no",
               SEX = "female", stringsAsFactors = FALSE))
## set levels to be the same as original data    
for (i in seq_len(ncol(students))){
    students[,i] <- factor(students[,i], levels(CEMS$students[,i]))
}
newdata <- list(preferences = 
    data.frame(student = factor(rep(c(500, 502), each = 6)), 
               school1 = factor(schools, levels = schools),
               school2 = factor("Stockholm", levels = schools)),
    students = students,
    schools = CEMS$schools)
    
predict(table6.model, newdata = newdata, se.fit = TRUE)

## the second set of predictions (elements 7-12) are equivalent to the output 
## of BTabilities; the first set are adjust for `WOR` being equal to "yes"
BTabilities(table6.model)




