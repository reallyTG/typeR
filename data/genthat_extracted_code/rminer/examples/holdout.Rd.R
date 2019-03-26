library(rminer)


### Name: holdout
### Title: Computes indexes for holdout data split into training and test
###   sets.
### Aliases: holdout
### Keywords: manip

### ** Examples

### simple examples:
# preserves order, last two elements go into test set
H=holdout(1:10,ratio=2,internal=TRUE,mode="order")
print(H)
# no seed or NULL returns different splits:
H=holdout(1:10,ratio=2/3,mode="random")
print(H)
H=holdout(1:10,ratio=2/3,mode="random",seed=NULL)
print(H)
# same seed returns identical split:
H=holdout(1:10,ratio=2/3,mode="random",seed=12345)
print(H)
H=holdout(1:10,ratio=2/3,mode="random",seed=12345)
print(H)

### classification example
data(iris)
# random stratified holdout
H=holdout(iris$Species,ratio=2/3,mode="stratified") 
print(table(iris[H$tr,]$Species))
print(table(iris[H$ts,]$Species))
M=fit(Species~.,iris[H$tr,],model="rpart") # training data only
P=predict(M,iris[H$ts,]) # test data
print(mmetric(iris$Species[H$ts],P,"CONF"))

### regression example with incremental and rolling window holdout:
## Not run: 
##D ts=c(1,4,7,2,5,8,3,6,9,4,7,10,5,8,11,6,9)
##D d=CasesSeries(ts,c(1,2,3))
##D print(d) # with 14 examples
##D # incremental holdout example (growing window)
##D for(b in 1:4) # iterations
##D   {
##D    H=holdout(d$y,ratio=4,mode="incremental",iter=b,window=5,increment=2)
##D    M=fit(y~.,d[H$tr,],model="mlpe",search=2)
##D    P=predict(M,d[H$ts,])
##D    cat("batch :",b,"TR from:",H$tr[1],"to:",H$tr[length(H$tr)],"size:",length(H$tr),
##D        "TS from:",H$ts[1],"to:",H$ts[length(H$ts)],"size:",length(H$ts),
##D        "mae:",mmetric(d$y[H$ts],P,"MAE"),"\n")
##D   }
##D # rolling holdout example (sliding window)
##D for(b in 1:4) # iterations
##D   {
##D    H=holdout(d$y,ratio=4,mode="rolling",iter=b,window=5,increment=2)
##D    M=fit(y~.,d[H$tr,],model="mlpe",search=2)
##D    P=predict(M,d[H$ts,])
##D    cat("batch :",b,"TR from:",H$tr[1],"to:",H$tr[length(H$tr)],"size:",length(H$tr),
##D        "TS from:",H$ts[1],"to:",H$ts[length(H$ts)],"size:",length(H$ts),
##D        "mae:",mmetric(d$y[H$ts],P,"MAE"),"\n")
##D   }
## End(Not run)



