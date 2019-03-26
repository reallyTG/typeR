library(energy)


### Name: disco
### Title: distance components (DISCO)
### Aliases: disco disco.between print.disco
### Keywords: htest multivariate

### ** Examples

      ## warpbreaks one-way decompositions
      data(warpbreaks)
      attach(warpbreaks)
      disco(breaks, factors=wool, R=99)

      ## When index=2 for univariate data, we get ANOVA decomposition
      disco(breaks, factors=tension, index=2.0, R=99)
      aov(breaks ~ tension)

      ## Multivariate response
      ## Example on producing plastic film from Krzanowski (1998, p. 381)
      tear <- c(6.5, 6.2, 5.8, 6.5, 6.5, 6.9, 7.2, 6.9, 6.1, 6.3,
                6.7, 6.6, 7.2, 7.1, 6.8, 7.1, 7.0, 7.2, 7.5, 7.6)
      gloss <- c(9.5, 9.9, 9.6, 9.6, 9.2, 9.1, 10.0, 9.9, 9.5, 9.4,
                 9.1, 9.3, 8.3, 8.4, 8.5, 9.2, 8.8, 9.7, 10.1, 9.2)
      opacity <- c(4.4, 6.4, 3.0, 4.1, 0.8, 5.7, 2.0, 3.9, 1.9, 5.7,
                   2.8, 4.1, 3.8, 1.6, 3.4, 8.4, 5.2, 6.9, 2.7, 1.9)
      Y <- cbind(tear, gloss, opacity)
      rate <- factor(gl(2,10), labels=c("Low", "High"))

	    ## test for equal distributions by rate
      disco(Y, factors=rate, R=99)
	    disco(Y, factors=rate, R=99, method="discoB")

      ## Just extract the decomposition table
      disco(Y, factors=rate, R=0)$stats

	    ## Compare eqdist.e methods for rate
	    ## disco between stat is half of original when sample sizes equal
	    eqdist.e(Y, sizes=c(10, 10), method="original")
	    eqdist.e(Y, sizes=c(10, 10), method="discoB")

      ## The between-sample distance component
      disco.between(Y, factors=rate, R=0)



