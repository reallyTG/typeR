### R code from vignette source 'ordinalgmifs.Rnw'

###################################################
### code chunk number 1: ordinalgmifs.Rnw:93-94
###################################################
options(width = 70)


###################################################
### code chunk number 2: ordinalgmifs.Rnw:96-100
###################################################
library("ordinalgmifs")
data(hccframe)
cumulative.logit<-ordinalgmifs(group ~ 1, x = hccframe[,-1], 
	data = hccframe, epsilon=0.01)


###################################################
### code chunk number 3: ordinalgmifs.Rnw:105-106
###################################################
print(cumulative.logit)


###################################################
### code chunk number 4: ordinalgmifs.Rnw:109-110
###################################################
summary(cumulative.logit)


###################################################
### code chunk number 5: ordinalgmifs.Rnw:118-119
###################################################
plot(cumulative.logit)


###################################################
### code chunk number 6: ordinalgmifs.Rnw:126-127
###################################################
coef(cumulative.logit)


###################################################
### code chunk number 7: ordinalgmifs.Rnw:132-135
###################################################
phat <- predict(cumulative.logit)
table(phat$class, hccframe$group)
head(phat$predicted)


