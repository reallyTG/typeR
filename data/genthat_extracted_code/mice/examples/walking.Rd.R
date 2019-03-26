library(mice)


### Name: walking
### Title: Walking disability data
### Aliases: walking
### Keywords: datasets

### ** Examples


md.pattern(walking)

micemill <- function(n) {
 for (i in 1:n) {
   imp <<- mice.mids(imp) # global assignment 
   cors <- with(imp, cor(as.numeric(YA),
                        as.numeric(YB),
                        method="kendall"))
   tau <<- rbind(tau, getfit(cors, s=TRUE))  # global assignment
 }
}

plotit <- function()
 matplot(x=1:nrow(tau),y=tau,
       ylab=expression(paste("Kendall's ",tau)), 
         xlab="Iteration", type="l", lwd=1,
       lty=1:10,col="black")

tau <- NULL
imp <- mice(walking, max=0, m=10, seed=92786)
pred <- imp$pred
pred[,c("src","age","sex")] <- 0
imp <- mice(walking, max=0, m=3, seed=92786, pred=pred)
micemill(5)
plotit()

### to get figure 7.8 van Buuren (2012) use m=10 and micemill(20) 




