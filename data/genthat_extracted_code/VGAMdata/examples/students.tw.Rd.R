library(VGAMdata)


### Name: students.tw
### Title: Taiwanese students answer a multiple response question
### Aliases: students.tw
### Keywords: datasets

### ** Examples

data(students.tw)
summary(students.tw)

with(students.tw, table(love, sex))
## Not run: 
##D plot(jitter(sex) ~ jitter(love), data = students.tw, col = "blue",
##D      main = "Taiwanese students")
## End(Not run)



