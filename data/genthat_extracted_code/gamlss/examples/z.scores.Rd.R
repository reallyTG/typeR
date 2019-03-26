library(gamlss)


### Name: z.scores
### Title: Z-scores for lms objects
### Aliases: z.scores
### Keywords: regression

### ** Examples

## Not run: 
##D IND<-sample.int(7040, 1000, replace=FALSE)
##D db1 <- db[IND,]
##D plot(head~age, data=db1)
##D m0 <-  lms(head, age, data=db1,trans.x=TRUE )
##D z.scores(m0, x=c(2,15,30,40),y=c(45,50,56,63))
## End(Not run)



