library(epiDisplay)


### Name: tableStack
### Title: Tabulation of variables in a stack form
### Aliases: tableStack
### Keywords: aplot

### ** Examples

data(Oswego)
tableStack(bakedham:fruitsalad, dataFrame=Oswego)
.data <- Oswego
des(.data)
attach(.data)
tableStack(bakedham:fruitsalad, .data) # Default data frame is .data
tableStack(bakedham:fruitsalad, .data, by= ill)
tableStack(bakedham:fruitsalad, .data, by= ill, prevalence=TRUE)
tableStack(bakedham:fruitsalad, .data, by= ill, percent=FALSE)
tableStack(bakedham:fruitsalad, .data, by= ill, percent=FALSE, name.test=FALSE)
detach(.data)


data(Cars93, package="MASS")
.data <- Cars93
des(.data)
tableStack(vars=4:25, .data, by=Origin)
tableStack(vars=4:25, .data, by="none")
tableStack(vars=4:25, .data, by=Origin, total.column=TRUE)


data(Attitudes)
.data <- Attitudes
attach(.data)
tableStack(qa1:qa18, .data)  # May need full screen of Rconsole
tableStack(qa1:qa18, .data, var.labels.trunc=35) 
                      # Fits in with default R console screen
tableStack(qa1:qa18, .data, reverse=TRUE) -> a
a
## Components of 'a' have appropriate items reversed
a$mean.score -> mean.score 
a$total.score -> total.score
.data$mean.score <- mean.score
.data$total.score <- total.score
rm(total.score, mean.score)
detach(.data)
attach(.data)
tableStack(c(qa1,qa13:qa18,mean.score,total.score), .data, by=sex, test=FALSE)
tableStack(c(qa15, qa17, mean.score:total.score), .data, by=sex, iqr=c(qa17,total.score))
tableStack(c(qa15, qa17, mean.score:total.score), .data, by=dep, iqr=c(qa17,total.score))
## 'vars' can be mixture of different classes of variables
.data$highscore <- mean.score > 4
tableStack(mean.score:highscore, .data, by=sex, iqr=total.score)
detach(.data)
rm(list=ls())

data(Ectopic)
.data <- Ectopic
des(.data)
tableStack(vars=3:4, .data, by=outc)
tableStack(vars=3:4, .data, by=outc, percent="none")
tableStack(vars=3:4, .data, by=outc, prevalence = TRUE)
tableStack(vars=3:4, .data, by=outc, name.test = FALSE)

## Variable in numeric or factor
data(Outbreak)
.data <- Outbreak
des(.data)
# Comparison of exposure to food items between the two gender
tableStack(vars=5:8, .data, by=sex) # as continuous varaibles
tableStack(vars=5:8, .data, by=sex, vars.to.factor = 5:8) # as factors



