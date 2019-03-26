library(alineR)


### Name: generate.training
### Title: Generate training dataset
### Aliases: generate.training
### Keywords: csv Table Candiate Alignments to Choose From

### ** Examples

# some cognates
data<-data.frame(dog=c('dog','perro'),cat=c('cat','gato'),rat=c('rat','rata'))

# write out a CSV file that can be openned in Excel and used for expert determinations
M<-generate.training(raw.data=data,search.size=100,file="open.with.excel.csv")




