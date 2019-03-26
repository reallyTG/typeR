library(DOS)


### Name: pinto
### Title: Welding and DNA-Protein Crosslinks
### Aliases: pinto
### Keywords: datasets

### ** Examples

data(pinto)
par(mfrow=c(1,3))
attach(pinto)
boxplot(mn~group,ylim=c(0,6),main="All",ylab="Micronuclei")
boxplot(mn[!longEx]~group[!longEx],ylim=c(0,6),main="Short Ex",ylab="Micronuclei")
boxplot(mn[longEx]~group[longEx],ylim=c(0,6),main="Long Ex",ylab="Micronuclei")

# Calculations in Table 5.5 of Design of Observational Studies (2010)
d<-mn[group=="painter"]-mn[group=="control"] # 22 pair differences
senWilcox(d,gamma=1)
senWilcox(d,gamma=2) # sensitive to gamma=2
senWilcox(d,gamma=3.3)
dLong<-d[longEx[group=="painter"]] # 12 pairs with long exposure
senWilcox(dLong,gamma=3.3) # insensitive to gamma=3.3



