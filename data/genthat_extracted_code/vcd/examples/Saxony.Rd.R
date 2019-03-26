library(vcd)


### Name: Saxony
### Title: Families in Saxony
### Aliases: Saxony
### Keywords: datasets

### ** Examples

data("Saxony")
gf <- goodfit(Saxony, type = "binomial")
summary(gf)
plot(gf)



