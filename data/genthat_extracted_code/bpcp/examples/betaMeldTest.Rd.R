library(bpcp)


### Name: betaMeldTest
### Title: Melded Beta Test
### Aliases: betaMeldTest
### Keywords: htest

### ** Examples

fisher.test(matrix(c(4,5,2,22),2,2),alternative="greater")

betaMeldTest(
    betaParms1=list(alower=2,blower=22+1,aupper=2+1,bupper=22),
    betaParms2=list(alower=4,blower=5+1,aupper=4+1,bupper=5),
    alternative="greater",parmtype="oddsratio",
    estimate1=2/24,estimate2=4/9)




