library(My.stepwise)


### Name: My.stepwise.coxph
### Title: Stepwise Variable Selection Procedure for Cox's Proportional
###   Hazards Model and Cox's Model
### Aliases: My.stepwise.coxph

### ** Examples

## Not run: 
##D The data 'lung' is available in the 'survival' package.
## End(Not run)

if (requireNamespace("survival", quietly = TRUE)) {
 lung <- survival::lung
}

names(lung)
dim(lung)
my.data <- na.omit(lung)
dim(my.data)
head(my.data)
my.data$status1 <- ifelse(my.data$status==2,1,0)
my.variable.list <- c("inst", "age", "sex", "ph.ecog", "ph.karno", "pat.karno")
My.stepwise.coxph(Time = "time", Status = "status1", variable.list = my.variable.list,
   in.variable = c("meal.cal", "wt.loss"), data = my.data)

my.variable.list <- c("inst", "age", "sex", "ph.ecog", "ph.karno", "pat.karno", "meal.cal",
   "wt.loss")
My.stepwise.coxph(Time = "time", Status = "status1", variable.list = my.variable.list,
   data = my.data, sle = 0.25, sls = 0.25)



