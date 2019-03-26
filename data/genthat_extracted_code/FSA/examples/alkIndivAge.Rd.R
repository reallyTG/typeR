library(FSA)


### Name: alkIndivAge
### Title: Use an age-length key to assign age to individuals in the unaged
###   sample.
### Aliases: alkIndivAge
### Keywords: manip

### ** Examples

## First Example -- Even breaks for length categories
WR1 <- WR79
# add length categories (width=5)
WR1$LCat <- lencat(WR1$len,w=5)
# isolate aged and unaged samples
WR1.age <- subset(WR1, !is.na(age))
WR1.len <- subset(WR1, is.na(age))
# note no ages in unaged sample
head(WR1.len)
# create age-length key
raw <- xtabs(~LCat+age,data=WR1.age)
( WR1.key <- prop.table(raw, margin=1) )
# apply the age-length key
WR1.len <- alkIndivAge(WR1.key,age~len,data=WR1.len)
# now there are ages
head(WR1.len)
# combine orig age & new ages
WR1.comb <- rbind(WR1.age, WR1.len)
# mean length-at-age
Summarize(len~age,data=WR1.comb,digits=2)
# age frequency distribution
( af <- xtabs(~age,data=WR1.comb) )
# proportional age distribution
( ap <- prop.table(af) )

## Second Example -- length sample does not have an age variable
WR2 <- WR79
# isolate age and unaged samples
WR2.age <- subset(WR2, !is.na(age))
WR2.len <- subset(WR2, is.na(age))
# remove age variable (for demo only)
WR2.len <- WR2.len[,-3]
# add length categories to aged sample
WR2.age$LCat <- lencat(WR2.age$len,w=5)
# create age-length key
raw <- xtabs(~LCat+age,data=WR2.age)
( WR2.key <- prop.table(raw, margin=1) )
# apply the age-length key
WR2.len <- alkIndivAge(WR2.key,~len,data=WR2.len)
# add length cat to length sample
WR2.len$LCat <- lencat(WR2.len$len,w=5)
head(WR2.len)
# combine orig age & new ages
WR2.comb <- rbind(WR2.age, WR2.len)
Summarize(len~age,data=WR2.comb,digits=2)

## Third Example -- Uneven breaks for length categories
WR3 <- WR79
# set up uneven breaks
brks <- c(seq(35,100,5),110,130)
WR3$LCat <- lencat(WR3$len,breaks=brks)
WR3.age <- subset(WR3, !is.na(age))
WR3.len <- subset(WR3, is.na(age))
head(WR3.len)
raw <- xtabs(~LCat+age,data=WR3.age)
( WR3.key <- prop.table(raw, margin=1) )
WR3.len <- alkIndivAge(WR3.key,age~len,data=WR3.len,breaks=brks)
head(WR3.len)
WR3.comb <- rbind(WR3.age, WR3.len)
Summarize(len~age,data=WR3.comb,digits=2)




