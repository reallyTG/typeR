library(itree)


### Name: kyphosis
### Title: Data on Children who have had Corrective Spinal Surgery
### Aliases: kyphosis
### Keywords: datasets

### ** Examples

#from the rpart examples:
fit <- itree(Kyphosis ~ Age + Number + Start, data=kyphosis)
fit2 <- itree(Kyphosis ~ Age + Number + Start, data=kyphosis,
              parms=list(prior=c(.65,.35), split='information'))
fit3 <- itree(Kyphosis ~ Age + Number + Start, data=kyphosis,
              control=itree.control(cp=.05))
par(mfrow=c(1,2))
plot(fit)
text(fit, use.n=TRUE)
plot(fit2)
text(fit2, use.n=TRUE)



