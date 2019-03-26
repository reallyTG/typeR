library(networktools)


### Name: impact.boot
### Title: Bootstrapping convenience function for impact statistics
### Aliases: impact.boot

### ** Examples

## No test: 
boot1 <- impact.boot(depression, boots=25, nodes="psychomotor_retardation")

boot2 <- impact.boot(social, boots=25, nodes="Kim", binary.data=TRUE, split="cutEqual")

##Note: for speed, 25 boots are used here; more are necessary in practice
## End(No test)



