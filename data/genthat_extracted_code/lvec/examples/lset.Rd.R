library(lvec)


### Name: lset
### Title: Set values in an lvec
### Aliases: lset lset.lvec lset.default lset.data.frame

### ** Examples

a <- as_lvec(1:10)
# set second element to 20
lset(a, 2, 20)
print(a)
# set odd elements to 20
lset(a, c(TRUE, FALSE), 20)
print(a)
# values are recycled
lset(a, 1:4, 100:101)
print(a)
# range index; set first 3 elements to NA
lset(a, range = c(1,3), NA)
print(a)




