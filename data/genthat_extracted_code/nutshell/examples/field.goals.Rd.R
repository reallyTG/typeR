library(nutshell)


### Name: field.goals
### Title: 2005 Field Goal Attempts
### Aliases: field.goals
### Keywords: datasets

### ** Examples

data(field.goals)
hist(field.goals$yards)
field.goals.forlr <- transform(field.goals,
  good=as.factor(ifelse(play.type=="FG good","good","bad")))
field.goals.table <- table(field.goals.forlr$good,
  field.goals.forlr$yards)
plot(colnames(field.goals.table),
  field.goals.table["good",] /
  (field.goals.table["bad",] +
   field.goals.table["good",]),
  xlab="Distance (Yards)",
  ylab="Percent Good"
)



