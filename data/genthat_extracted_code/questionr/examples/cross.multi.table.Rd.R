library(questionr)


### Name: cross.multi.table
### Title: Two-way frequency table between a multiple choices question and
###   a factor
### Aliases: cross.multi.table

### ** Examples

## Sample data frame
set.seed(1337)
sex <- sample(c("Man","Woman"),100,replace=TRUE)
jazz <- sample(c(0,1),100,replace=TRUE)
rock <- sample(c(TRUE, FALSE),100,replace=TRUE)
electronic <- sample(c("Y","N"),100,replace=TRUE)
weights <- runif(100)*2
df <- data.frame(sex,jazz,rock,electronic,weights)
## Two-way frequency table on 'music' variables by sex
cross.multi.table(df[,c("jazz", "rock","electronic")], df$sex, true.codes=list("Y"))
## Column percentages based on respondants
cross.multi.table(df[,c("jazz", "rock","electronic")], df$sex, true.codes=list("Y"), freq=TRUE)
## Row percentages based on respondants
cross.multi.table(df[,c("jazz", "rock","electronic")], 
                  df$sex, true.codes=list("Y"), freq=TRUE, tfreq="row", n=TRUE)



