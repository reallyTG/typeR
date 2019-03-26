library(agridat)


### Name: student.barley
### Title: Multi-environment trial of barley
### Aliases: student.barley

### ** Examples


data(student.barley)
dat <- student.barley

require(lattice)
bwplot(yield ~ gen|district, dat, main="student.barley - yield")

dat$year <- factor(dat$year)
dat$income <- NULL

# convert to tons/ha
dat <- transform(dat, yield=yield*14 * 0.00112085116)

# Define 'loc' the way that Kempton does
dat$loc <- rep("",nrow(dat))
dat[is.element(dat$farmer, c("Allardyce","Roche","Quinn")),"loc"] <- "1"
dat[is.element(dat$farmer, c("Luttrell","Dooley")), "loc"] <- "2"
dat[is.element(dat$year, c("1904","1905","1906")) & dat$farmer=="Kearney","loc"] <- "2"
dat[dat$farmer=="Mulhall","loc"] <- "3"

dat <- transform(dat, loc=factor(paste(place,loc,sep="")))

if(require(reshape2)){
datm <- melt(dat, measure.var='yield')

# Kempton Table 9.5
round(acast(datm, loc+gen~year),2)

# Kempton Table 9.6
d2 <- dcast(datm, year+loc~gen)
mean(d2$Archer)
mean(d2$Goldthorpe)
mean(d2$Archer-d2$Goldthorpe)
sqrt(var(d2$Archer-d2$Goldthorpe)/51)
cor(d2$Archer,d2$Goldthorpe)
}


## Not run: 
##D   # Kempton Table 9.6b
##D   require(lme4)
##D   m2 <- lmer(yield~1 + (1|loc) + (1|year) +
##D                (1|loc:year) + (1|gen:loc) + (1|gen:year), data=dat,
##D              control=lmerControl(check.nobs.vs.rankZ="ignore"))
## End(Not run)




