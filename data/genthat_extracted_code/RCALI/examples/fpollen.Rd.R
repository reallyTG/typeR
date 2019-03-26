library(RCALI)


### Name: fpollen
### Title: Individual pollen dispersion function
### Aliases: fpollen
### Keywords: manip

### ** Examples

distance = seq(1,1.5, by=0.05)
a=matrix(distance, ncol=1)
b= apply(a,1,fpollen)
par(pty="s")
plot(x=distance, y =b)
lines(x=distance, y = apply(a,1,fseed))



