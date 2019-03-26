library(twoway)


### Name: insectCounts
### Title: Counts of an insect for the combinations of 4 treatments and 6
###   areas of a field
### Aliases: insectCounts
### Keywords: data

### ** Examples

insect.2way <- twoway(insectCounts, method="median")
print(insect.2way, digits=2)

plot(insect.2way)
plot(insect.2way, which="diagnose")

# try sqrt transformation
insect.sqrt <- twoway(sqrt(insectCounts), method="median")
print(insect.sqrt, digits=2)

plot(insect.sqrt)
plot(insect.sqrt, which="diagnose")



