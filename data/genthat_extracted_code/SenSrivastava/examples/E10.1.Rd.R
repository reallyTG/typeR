library(SenSrivastava)


### Name: E10.1
### Title: Multicollinear Data
### Aliases: E10.1
### Keywords: datasets

### ** Examples

data(E10.1)
attach(E10.1)
plot(x.1, x.2)
names(E10.1)
hascar <- require(car)
if (hascar) {
   mod <- lm(y.1 ~ x.1+x.2, data=E10.1)
   vif(mod)
}



