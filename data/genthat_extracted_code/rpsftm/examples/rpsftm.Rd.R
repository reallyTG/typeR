library(rpsftm)


### Name: rpsftm
### Title: Rank Preserving Structural Failure Time Model
### Aliases: rpsftm

### ** Examples

?immdef
fit <- rpsftm(Surv(progyrs, prog)~rand(imm,1-xoyrs/progyrs),immdef, censyrs)
print(fit)
summary(fit)
plot(fit)




