library(bsts)


### Name: HarveyCumulator
### Title: HarveyCumulator
### Aliases: HarveyCumulator
### Keywords: models regression

### ** Examples


data(goog)
days <- factor(weekdays(index(goog)),
               levels = c("Monday", "Tuesday", "Wednesday",
                          "Thursday", "Friday"),
               ordered = TRUE)

## Because of holidays, etc the days do not always go in sequence.
## (Sorry, Rebecca Black! https://www.youtube.com/watch?v=kfVsfOSbJY0)
## diff.days[i] is the number of days between days[i-1] and days[i].
## We know that days[i] is the end of a week if diff.days[i] < 0.
diff.days <- tail(as.numeric(days), -1) - head(as.numeric(days), -1)
contains.end <- c(FALSE, diff.days < 0)

goog.weekly <- HarveyCumulator(goog, contains.end, 1)





