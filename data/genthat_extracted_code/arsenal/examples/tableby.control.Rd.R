library(arsenal)


### Name: tableby.control
### Title: Control settings for 'tableby' function
### Aliases: tableby.control

### ** Examples

set.seed(100)
## make 3+ categories for Response
mdat <- data.frame(Response=c(0,0,0,0,0,1,1,1,1,1),
                   Sex=sample(c("Male", "Female"), 10,replace=TRUE),
                   Age=round(rnorm(10,mean=40, sd=5)),
                   HtIn=round(rnorm(10,mean=65,sd=5)))

## allow default summaries in RHS variables, and pass control args to
## main function, to be picked up with ... when calling tableby.control
outResp <- tableby(Response ~ Sex + Age + HtIn, data=mdat, total=FALSE, test=TRUE)
outCtl <- tableby(Response ~ Sex + Age + HtIn, data=mdat,
                  control=tableby.control(total=TRUE, cat.simplify=TRUE,
                  cat.stats=c("Nmiss","countpct"),digits=1))
summary(outResp, text=TRUE)
summary(outCtl, text=TRUE)



