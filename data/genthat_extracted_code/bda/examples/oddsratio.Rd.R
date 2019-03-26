library(bda)


### Name: oddsratio
### Title: Odds Ratio and Relative Risk
### Aliases: oddsratio oddsratio.data.frame oddsratio.matrix
###   oddsratio.default print.odds
### Keywords: htest

### ** Examples


#  library(bstats)
x = c(1,0)
n = c(72370,73058)
oddsratio(x,n=n)

Convictions <-
     matrix(c(2, 10, 15, 3),
            nrow = 2,
            dimnames =
            list(c("Dizygotic", "Monozygotic"),
                 c("Convicted", "Not convicted")))
     Convictions
     fisher.test(Convictions, conf.level = 0.95)$conf.int

x = matrix(c(2,10,17,13), ncol=2)
oddsratio(x)

Convictions <-
     matrix(c(8, 492, 0, 500), nrow = 2, byrow=TRUE)
fisher.test(Convictions, conf.level = 0.95)$conf.int

x = c(8,0)
n = c(500,500)
oddsratio(x,n=n)




