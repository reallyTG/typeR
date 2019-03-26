library(Hmisc)


### Name: samplesize.bin
### Title: Sample Size for 2-sample Binomial
### Aliases: samplesize.bin
### Keywords: htest category

### ** Examples

alpha <- .05
beta <- c(.70,.80,.90,.95)


# N1 is a matrix of total sample sizes whose
# rows vary by hypothesized treatment success probability and
# columns vary by power
# See Meinert's book for formulae.


N1 <- samplesize.bin(alpha, beta, pit=.55, pic=.5)
N1 <- rbind(N1, samplesize.bin(alpha, beta, pit=.60, pic=.5))
N1 <- rbind(N1, samplesize.bin(alpha, beta, pit=.65, pic=.5))
N1 <- rbind(N1, samplesize.bin(alpha, beta, pit=.70, pic=.5))
attr(N1,"dimnames") <- NULL


#Accounting for 5% noncompliance in the treated group
inflation <- (1/.95)**2
print(round(N1*inflation+.5,0))



