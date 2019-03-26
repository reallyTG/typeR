library(eeptools)


### Name: eeptools
### Title: Evaluation of educational policy tools
### Aliases: eeptools eeptools-package

### ** Examples

gender<-c("M","M","M","F","F","F")
statamode(gender)
statamode(gender[1:5])

missing_data<-c(NA,NA,NA)
max_mis(missing_data)

makenum(gender)
gender <- factor(gender)
defac(gender)



