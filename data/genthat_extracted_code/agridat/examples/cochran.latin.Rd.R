library(agridat)


### Name: cochran.latin
### Title: Latin square design in wheat
### Aliases: cochran.latin
### Keywords: datasets

### ** Examples


data(cochran.latin)
dat <- cochran.latin

if(require(desplot)){
  desplot(diff~col*row, dat,
          text=operator, cex=1, # aspect unknown
          main="cochran.latin")
}


dat <- transform(dat, rf=factor(row), cf=factor(col))
aov.dat <- aov(diff ~ operator + Error(rf*cf), dat)
summary(aov.dat)
model.tables(aov.dat, type="means")



