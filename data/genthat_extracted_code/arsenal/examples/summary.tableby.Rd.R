library(arsenal)


### Name: summary.tableby
### Title: The summary method for a 'tableby' object
### Aliases: summary.tableby as.data.frame.summary.tableby

### ** Examples


set.seed(100)
## make 3+ categories for response
nsubj <- 90
mdat <- data.frame(Response=sample(c(1,2,3),nsubj, replace=TRUE),
                   Sex=sample(c("Male", "Female"), nsubj,replace=TRUE),
                   Age=round(rnorm(nsubj,mean=40, sd=5)),
                   HtIn=round(rnorm(nsubj,mean=65,sd=5)))

## allow default summaries on RHS variables
out <- tableby(Response ~ Sex + Age + HtIn, data=mdat)
summary(out, text=TRUE)
labels(out)
labels(out) <- c(Age="Age (years)", HtIn="Height (inches)")
summary(out, stats.labels=c(meansd="Mean-SD", q1q3 = "Q1-Q3"), text=TRUE)




