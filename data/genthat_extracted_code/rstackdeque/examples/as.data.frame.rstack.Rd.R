library(rstackdeque)


### Name: as.data.frame.rstack
### Title: Convert an rstack to a data.frame
### Aliases: as.data.frame.rstack

### ** Examples

s <- rstack()
s <- insert_top(s, data.frame(names = c("Bob", "Joe"), ages = c(25, 18)))
s <- insert_top(s, data.frame(names = c("Mary", "Kate", "Ashley"), ages = c(27, 26, 21)))
print(s)

sd <- as.data.frame(s)
print(sd)

## Elements may be similarly-named lists as well, representing individual rows:
s <- rstack()
s <- insert_top(s, list(name = "Bob", age = 25))
s <- insert_top(s, list(name = "Mary", age = 24))
print(s)

sd <- as.data.frame(s)
print(sd)

## Building a stack in a loop, converting to a dataframe after the fact:
s <- rstack()
for(i in 1:1000) {
 if(runif(1,0,1) < 0.5) {
   s <- insert_top(s, data.frame(i = i, type = "sqrt", val = sqrt(i)))
 } else {
   s <- insert_top(s, data.frame(i = i, type = "log", val = log(i)))
 }
 if(i %% 100 == 0) {
   print(i/1000)
 }
}
print(head(as.data.frame(s)))



