library(rminer)


### Name: delevels
### Title: Reduce (delete) or replace levels from a factor variable (useful
###   for preprocessing datasets).
### Aliases: delevels
### Keywords: manip

### ** Examples

f=factor(c("A","A","B","B","C","D","E"))
print(table(f))
f1=delevels(f,"A","a")
print(table(f1))
f2=delevels(f,c("C","D","E"),"CDE")
print(table(f2))
f3=delevels(f,c("B","C","D","E"))
print(table(f3))



