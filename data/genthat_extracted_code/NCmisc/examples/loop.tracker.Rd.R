library(NCmisc)


### Name: loop.tracker
### Title: Creates a progess bar within a loop
### Aliases: loop.tracker

### ** Examples

# simple example with a for-loop
max <- 100; for (cc in 1:max) { loop.tracker(cc,max); wait(0.004,"s") }
#example using the 'time to go' with a while loop
cc <- 0; max <- 10; start <- proc.time()
while(cc < max) { cc <- cc + 1; wait(0.05,"s"); loop.tracker(cc,max,start,unit="s") }
# example with saving an object, and restoring after a crash
X <- matrix(rnorm(5000),nrow=50); max <- nrow(X); sums <- numeric(max)
for (cc in 1:max) { 
  sums[cc] <- sum(X[cc,])
  wait(.05) # just so this trivial loop doesn't finish so quickly
  loop.tracker(cc,max, sav.obj=sums, sav.fn="temp.rda", sav.freq=5);
  if(cc==29) { warning("faked a crash at iteration 29!"); rm(sums); break }
}
cat("\nloaded latest backup from iteration 28:",paste(load("temp.rda")),"\n")
print(sav.obj); unlink("temp.rda")



