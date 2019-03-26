library(rstackdeque)


### Name: as.data.frame.rdeque
### Title: Convert an rdeque to a data.frame
### Aliases: as.data.frame.rdeque

### ** Examples

d <- rdeque()
d <- insert_front(d, data.frame(names = c("Bob", "Joe"), ages = c(25, 18)))
d <- insert_front(d, data.frame(names = c("Mary", "Kate", "Ashley"), ages = c(27, 26, 21)))
print(d)

dd <- as.data.frame(d)
print(dd)

## Elements may be similarly-named lists as well, representing individual rows:
d <- rdeque()
d <- insert_front(d, list(name = "Bob", age = 25))
d <- insert_front(d, list(name = "Mary", age = 24))
print(d)

dd <- as.data.frame(d)
print(dd)

## Building a deque in a loop, converting to a dataframe after the fact:
d <- rdeque()
for(i in 1:1000) {
 if(runif(1,0,1) < 0.5) {
   d <- insert_front(d, data.frame(i = i, type = "sqrt", val = sqrt(i)))
 } else {
   d <- insert_back(d, data.frame(i = i, type = "log", val = log(i)))
 }
 if(i %% 100 == 0) {
   print(i/1000)
 }
}
print(head(as.data.frame(d)))



