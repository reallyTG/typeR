library(untb)


### Name: species.count
### Title: Ecosystem diagnostics for output of untb()
### Aliases: species.count species.table
### Keywords: math

### ** Examples

a <- untb(start=rep(1,50), prob=0.01, gens=2000, keep=TRUE)

plot(species.count(a),type="b")
matplot(species.table(a),type="l",lty=1)

jj <- a[2000,]
print(jj)
as.count(jj)




