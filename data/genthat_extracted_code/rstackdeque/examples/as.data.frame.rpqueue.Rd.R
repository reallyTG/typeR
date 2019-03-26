library(rstackdeque)


### Name: as.data.frame.rpqueue
### Title: Convert an rpqueue to a data.frame
### Aliases: as.data.frame.rpqueue

### ** Examples

q <- rpqueue()
q <- insert_back(q, data.frame(names = c("Bob", "Joe"), ages = c(25, 18)))
q <- insert_back(q, data.frame(names = c("Mary", "Kate", "Ashley"), ages = c(27, 26, 21)))
print(q)

qq <- as.data.frame(q)
print(qq)

## Elements may be similarly-named lists as well, representing individual rows:
q <- rpqueue()
q <- insert_back(q, list(name = "Bob", age = 25))
q <- insert_back(q, list(name = "Mary", age = 24))
print(q)

qq <- as.data.frame(q)
print(qq)

## Building a deque in a loop, converting to a dataframe after the fact:
q <- rpqueue()
for(i in 1:1000) {
 if(runif(1,0,1) < 0.5) {
   q <- insert_back(q, data.frame(i = i, type = "sqrt", val = sqrt(i)))
 } else {
   q <- insert_back(q, data.frame(i = i, type = "log", val = log(i)))
 }
 if(i %% 100 == 0) {
   print(i/1000)
 }
}
print(head(as.data.frame(q)))



