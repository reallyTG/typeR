library(anchors)


### Name: cpolr
### Title: Censored ordered probit
### Aliases: cpolr
### Keywords: models

### ** Examples


data(freedom)

## an example of directly using cpolr:
ra <- anchors(self ~ vign1 + vign3 + vign6, data = freedom, method ="C")
freedom2 <- insert(freedom, ra )
out <- cpolr(cbind(Cs, Ce) ~ as.factor(country) + sex + educ, 
            data = freedom2)
summary(out)


## simplified in the context of anchors:
fo <- list(self= self ~ 1,
           vign = cbind(vign1,vign3,vign6) ~ 1,
           cpolr= ~ as.factor(country) + sex + educ)
ra2 <- anchors(self ~ vign1 + vign3 + vign6, data = freedom, method ="C")
summary(ra, ties="cpolr")

## AVERAGE fitted values
## conditional on observed 
fitted(ra2, ties="cpolr", unconditional=FALSE,average=TRUE)
## unconditional prediction
fitted(ra2, ties="cpolr", unconditional=TRUE,average=TRUE)

## fitted probability for each observation
## conditional on observed 
fitted(ra2, ties="cpolr", unconditional=TRUE, average=FALSE)
## unconditional prediction
fitted(ra2, ties="cpolr", unconditional=TRUE, average=FALSE)




