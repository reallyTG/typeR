library(mrgsolve)


### Name: mrgsims
### Title: Methods for working with 'mrgsims' objects.
### Aliases: mrgsims $,mrgsims-method tail,mrgsims-method
###   head,mrgsims-method dim,mrgsims-method names,mrgsims-method
###   as.data.frame,mrgsims-method as.matrix,mrgsims-method
###   subset,mrgsims-method summary,mrgsims-method show,mrgsims-method

### ** Examples


## example("mrgsims")

mod <- mrgsolve:::house() %>% init(GUT=100)

out <- mrgsim(mod)
class(out)

out
head(out)
tail(out)

mrgsolve:::mod(out)

dim(out)
names(out)

mat <- as.matrix(out)
df <- as.data.frame(out)

df <- subset(out, time < 12) ## a data frame
out$CP

plot(out)
plot(out, CP~.)
plot(out, CP+RESP~time, scales="same", xlab="Time", main="Model sims")




