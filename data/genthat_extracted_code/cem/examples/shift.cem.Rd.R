library(cem)


### Name: shift.cem
### Title: Diagnostic tool for CEM
### Aliases: shift.cem
### Keywords: datagen

### ** Examples

## Not run: 
##D data(LL)
##D 
##D m74 <- max(LL$re74, na.rm=TRUE)
##D s74 <- seq(0,m74,by=sd(LL$re74))
##D l74 <- length(s74)
##D if(max(s74) < m74) s74 <- c(s74, m74)
##D 
##D m75 <- max(LL$re75, na.rm=TRUE)
##D s75 <- seq(0,m75,by=sd(LL$re75))
##D l75 <- length(s75)
##D if(max(s75) < m75) s75 <- c(s75, m75)
##D 
##D mybr = list(re74=s74, 
##D  re75 = s75,
##D  age = hist(LL$age,plot=FALSE)$breaks,
##D  education = hist(LL$education,plot=FALSE)$breaks)
##D 
##D mat <- cem(treatment="treated",data=LL, drop="re78",cut=mybr)
##D mat
##D 
##D shift.cem(mat, data=LL, shifts=seq(0.01, 0.5, length=10), verb=1)
## End(Not run)



