library(DAAG)


### Name: socsupport
### Title: Social Support Data
### Aliases: socsupport
### Keywords: datasets

### ** Examples

attach(socsupport)

not.na <- apply(socsupport[,9:19], 1, function(x)!any(is.na(x)))
ss.pr1 <- princomp(as.matrix(socsupport[not.na, 9:19]), cor=TRUE)  
pairs(ss.pr1$scores[,1:3])
sort(-ss.pr1$scores[,1])        # Minus the largest value appears first
pause()

not.na[36] <- FALSE
ss.pr <- princomp(as.matrix(socsupport[not.na, 9:19]), cor=TRUE)  
summary(ss.pr)          # Examine the contribution of the components
pause()

# We now regress BDI on the first six principal components:
ss.lm <- lm(BDI[not.na] ~ ss.pr$scores[, 1:6], data=socsupport)
summary(ss.lm)$coef
pause()

ss.pr$loadings[,1]
plot(BDI[not.na] ~  ss.pr$scores[ ,1], col=as.numeric(gender), 
pch=as.numeric(gender),  xlab ="1st principal component", ylab="BDI")
topleft <- par()$usr[c(1,4)]
legend(topleft[1], topleft[2], col=1:2, pch=1:2, legend=levels(gender))



