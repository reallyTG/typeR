library(mem)


### Name: transformdata
### Title: Data transformation
### Aliases: transformdata
### Keywords: influenza

### ** Examples

# Castilla y Leon Influenza Rates data
data(flucylraw)
# Transform data
newdata<-transformdata(flucylraw, i.range.x=c(40,20))$data
epi<-memmodel(newdata)
print(epi)
summary(epi)
plot(epi)




