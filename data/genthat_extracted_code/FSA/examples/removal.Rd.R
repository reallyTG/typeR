library(FSA)


### Name: removal
### Title: Population estimates for k-, 3-, or 2-pass removal data.
### Aliases: removal summary.removal confint.removal
### Keywords: manip

### ** Examples

## First example -- 3 passes
ct3 <- c(77,50,37)

# Carle Strub (default) method
p1 <- removal(ct3)
summary(p1)
summary(p1,verbose=TRUE)
summary(p1,parm="No")
summary(p1,parm="p")
confint(p1)
confint(p1,parm="No")
confint(p1,parm="p")

# Moran method
p2 <- removal(ct3,method="Moran")
summary(p2,verbose=TRUE)
confint(p2,verbose=TRUE)
#'
# Schnute method
p3 <- removal(ct3,method="Schnute")
summary(p3,verbose=TRUE)
confint(p3,verbose=TRUE)

# Burnham method
p4 <- removal(ct3,method="Burnham")
summary(p4)
summary(p4,verbose=TRUE)
summary(p4,parm="No")
summary(p4,parm="p")
confint(p4)
confint(p4,parm="No")
confint(p4,parm="p")
## Second example -- 2 passes
ct2 <- c(77,37)

# Seber method
p4 <- removal(ct2,method="Seber2")
summary(p4,verbose=TRUE)
confint(p4)


### Test if catchability differs between first sample and the other samples
# chi-square test statistic from  negative log-likelihoods
#   from Moran and Schnute fits (from above)
chi2.val <- 2*(p2$min.nlogLH-p3$min.nlogLH)
# p-value ... no significant difference
pchisq(chi2.val,df=1,lower.tail=FALSE)

# Another LRT example ... sample 1 from Schnute (1983)
ct4 <- c(45,11,18,8)
p2a <- removal(ct4,method="Moran")
p3a <- removal(ct4,method="Schnute")
chi2.val <- 2*(p2a$min.nlogLH-p3a$min.nlogLH)  # 4.74 in Schnute(1983)
pchisq(chi2.val,df=1,lower.tail=FALSE)         # significant difference (catchability differs)
summary(p3a)


### Using lapply() to use removal() on many different groups
###   with the removals in a single variable ("long format")
## create a dummy data frame
lake <- factor(rep(c("Ash Tree","Bark","Clay"),each=5))
year <- factor(rep(c("2010","2011","2010","2011","2010","2011"),times=c(2,3,3,2,2,3)))
pass <- factor(c(1,2,1,2,3,1,2,3,1,2,1,2,1,2,3))
catch <- c(57,34,65,34,12,54,26,9,54,27,67,34,68,35,12)
d <- data.frame(lake,year,pass,catch)

## create a variable that indicates each different group
d$group <- with(d,interaction(lake,year))
d
## split the catch by the different groups (creates a list of catch vectors)
ds <- split(d$catch,d$group)
## apply removal() to each catch vector (i.e., different group)
res <- lapply(ds,removal,just.ests=TRUE)
res <- data.frame(t(data.frame(res,check.names=FALSE)))
## get rownames from above and split into separate columns
nms <- t(data.frame(strsplit(rownames(res),"\\.")))
attr(nms,"dimnames") <- NULL
fnl <- data.frame(nms,res)
## put names together with values
rownames(fnl) <- NULL
colnames(fnl)[1:2] <- c("Lake","Year")
fnl


### Using apply() to use removal() on many different groups
###   with the removals in several variables ("wide format")
## create a dummy data frame (just reshaped from above as
## an example; -5 to ignore the group variable from above)
d1 <- reshape(d[,-5],timevar="pass",idvar=c("lake","year"),direction="wide")
## apply restore() to each row of only the catch data
res1 <- apply(d1[,3:5],MARGIN=1,FUN=removal,method="CarleStrub",just.ests=TRUE)
res1 <- data.frame(t(data.frame(res1,check.names=FALSE)))
## add the grouping information to the results
fnl1 <- data.frame(d1[,1:2],res1)
## put names together with values
rownames(fnl1) <- NULL
fnl1




