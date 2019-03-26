library(moult)


### Name: weavers
### Title: Weaver Moult Data
### Aliases: weavers
### Keywords: datasets

### ** Examples

data(weavers)
head(weavers)

if (is.numeric(weavers$Moult)) {
scores <- format(weavers$Moult, scientific = FALSE, trim = TRUE)
} else {
scores <- weavers$Moult
}

mscores <- substr(scores, 1, 9)
feather.mass <- c(10.4, 10.8, 11.5, 12.8, 14.4, 15.6, 16.3, 15.7, 15.7)

## convert moult scores to proportion of feather mass grown

weavers$pfmg <- ms2pfmg(mscores, feather.mass)
weavers$day <- date2days(weavers$RDate, dateformat = "yyyy-mm-dd", startmonth = 8)
ssex <- ifelse(weavers$Sex == 1 | weavers$Sex == 3, "male", 
  ifelse(weavers$Sex == 2 | weavers$Sex == 4, "female", NA))
weavers$ssex <- as.factor(ssex)

## model with duration and mean start date of moult depending on sex

mmf <- moult(pfmg ~ day | ssex | ssex, data = weavers, type = 3)
summary(mmf)

## predict duration and start of moult (then both) for males and females

ssex <- c("male", "female") 
day <- 150

(p1 <- predict.moult(mmf, newdata = data.frame(day, ssex), predict.type = "duration"))
(p2 <- predict.moult(mmf, newdata = data.frame(day, ssex), predict.type = "start"))
(p3 <- predict.moult(mmf, newdata = data.frame(day, ssex), predict.type = "both"))




