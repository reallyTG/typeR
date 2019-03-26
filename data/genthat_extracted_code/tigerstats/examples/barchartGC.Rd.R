library(tigerstats)


### Name: barchartGC
### Title: Easy Barcharts
### Aliases: barchartGC

### ** Examples

#barchart of counts for one factor variable:
barchartGC(~sex,data=m111survey)

#barchart with percentages and title:
barchartGC(~sex,data=m111survey,
   type="percent",
   main="Distribution of Sex")

#barchart of counts, to study the relationship between
#two factor variables:
barchartGC(~sex+seat,data=m111survey)

#percentage barchart, two factor variables:
barchartGC(~sex+seat,data=m111survey,type="percent")

#From tabulated data:
sexseat <- xtabs(~sex+seat,data=m111survey)
barchartGC(sexseat,type="percent",main="Sex and Seating Preference")

#from tabulated data:
dieTosses <- c(one=8,two=18,three=11,four=7,five=9,six=7)
barchartGC(dieTosses,main="60 Rolls of a Die")

# a "flat" barchart, pictorial version of xtabs() 
barchartGC(~sex+seat,data=m111survey,flat=TRUE,ylab="Sex")

# a "flat" barchart, pictorial version of xtabs() 
barchartGC(~sex+seat,data=m111survey,type="percent",flat=TRUE,ylab="Sex")



