library(rtrim)


### Name: wald
### Title: Test significance of TRIM coefficients with the Wald test
### Aliases: wald wald.trim

### ** Examples

data(skylark)
z2 <- trim(count ~ site + time, data=skylark, model=2)
# print info on significance of slope parameters
print(z2)
z3 <- trim(count ~ site + time, data=skylark, model=3)
# print info on significance of deviations from linear trend
wald(z3)



