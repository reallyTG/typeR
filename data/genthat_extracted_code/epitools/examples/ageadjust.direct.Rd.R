library(epitools)


### Name: ageadjust.direct
### Title: Age standardization by direct method, with exact confidence
###   intervals
### Aliases: ageadjust.direct
### Keywords: models

### ** Examples

## Data from Fleiss, 1981, p. 249 
population <- c(230061, 329449, 114920, 39487, 14208, 3052,
72202, 326701, 208667, 83228, 28466, 5375, 15050, 175702,
207081, 117300, 45026, 8660, 2293, 68800, 132424, 98301, 
46075, 9834, 327, 30666, 123419, 149919, 104088, 34392, 
319933, 931318, 786511, 488235, 237863, 61313)
population <- matrix(population, 6, 6, 
dimnames = list(c("Under 20", "20-24", "25-29", "30-34", "35-39",
"40 and over"), c("1", "2", "3", "4", "5+", "Total")))
population
count <- c(107, 141, 60, 40, 39, 25, 25, 150, 110, 84, 82, 39,
3, 71, 114, 103, 108, 75, 1, 26, 64, 89, 137, 96, 0, 8, 63, 112,
262, 295, 136, 396, 411, 428, 628, 530)
count <- matrix(count, 6, 6, 
dimnames = list(c("Under 20", "20-24", "25-29", "30-34", "35-39",
"40 and over"), c("1", "2", "3", "4", "5+", "Total")))
count

### Use average population as standard
standard<-apply(population[,-6], 1, mean)
standard

### This recreates Table 1 of Fay and Feuer, 1997
birth.order1<-ageadjust.direct(count[,1],population[,1],stdpop=standard)
round(10^5*birth.order1,1)

birth.order2<-ageadjust.direct(count[,2],population[,2],stdpop=standard)
round(10^5*birth.order2,1)

birth.order3<-ageadjust.direct(count[,3],population[,3],stdpop=standard)
round(10^5*birth.order3,1)

birth.order4<-ageadjust.direct(count[,4],population[,4],stdpop=standard)
round(10^5*birth.order4,1)

birth.order5p<-ageadjust.direct(count[,5],population[,5],stdpop=standard)
round(10^5*birth.order5p,1)




