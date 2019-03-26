library(AGD)


### Name: extractLMS
### Title: Extracts LMS values from a gamlss object.
### Aliases: extractLMS
### Keywords: distribution

### ** Examples


## Not run: 
##D #
##D library(gamlss)
##D boys <- boys7482
##D 
##D # calculate initial M curve
##D data <- na.omit(boys[,1:2])
##D f0154  <- gamlss(hgt~cs(age,df=15,c.spar=c(-1.5,2.5)),
##D                 sigma.formula=~cs(age,df=4,c.spar=c(-1.5,2.5)),
##D                 data=data,family=NO,
##D                 control=gamlss.control(n.cyc=3))                      
##D 
##D # calculate transformed age
##D t.age <- fitted(lm(data$age~fitted(f0154)))
##D t.age <- t.age - min(t.age)
##D data.t <- data.frame(data,t.age=t.age)
##D 
##D # calculate final solution
##D f0106r <- gamlss(hgt~cs(t.age,df=10,c.spar=c(-1.5,2.5)),
##D                 sigma.formula=~cs(t.age,df=6,c.spar=c(-1.5,2.5)),
##D                 data=data.t,family=NO,
##D                 control=gamlss.control(n.cyc=3))
##D 
##D # extract the LMS reference table in the 'classic' age grid
##D nl4.hgt.boys <- extractLMS(fit = f0106r, data=data.t, grid="compact", 
##D                dec = c(0,2,5))
##D nl4.hgt.boys
##D 
##D 
##D # flatten the reference beyond age 20Y (not very useful in this data)
##D nl4.hgt.boys.flat <- extractLMS(fit = f0106r, data=data.t, flatAge=20)
##D nl4.hgt.boys.flat
##D 
##D # use log age transformation
##D data.t <- data.frame(data, t.age = log(data$age))
##D f0106rlog <- gamlss(hgt~cs(t.age,df=10,c.spar=c(-1.5,2.5)),
##D                 sigma.formula=~cs(t.age,df=6,c.spar=c(-1.5,2.5)),
##D                 data=data.t,family=NO,
##D                 control=gamlss.control(n.cyc=1))
##D 
##D nl4.hgt.boys.log <- extractLMS(fit = f0106rlog, data=data.t)
##D nl4.hgt.boys.log
## End(Not run)



