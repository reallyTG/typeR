## ----setup, echo = FALSE-------------------------------------------------
knitr::opts_chunk$set(
    collapse=TRUE,
    comment = NA,
    prompt = TRUE
    )
set.seed(42)

## ----installation CRAN, eval=FALSE---------------------------------------
#  install.packages("Rsampling")

## ----installation GitHub, eval=FALSE-------------------------------------
#  library(devtools)
#  install_github(repo = 'lageIBUSP/Rsampling')

## ----load library--------------------------------------------------------
library(Rsampling)

## ----inspecting object embauba-------------------------------------------
head(embauba)
summary(embauba)

## ----proportion of infestation by morphotype-----------------------------
tapply(embauba$with.vines, embauba$morphotype, mean)

## ----statistic of interest cecropia--------------------------------------
emb.si <- function(dataframe){
    props <- tapply(dataframe$with.vines, dataframe$morphotype, mean)
    props[[1]] - props[[2]]
}
## Verifying
emb.si(embauba)

## ----cecropia resampling, results="hide"---------------------------------
emb.r <- Rsampling(type = "normal", dataframe = embauba,
                   statistics = emb.si, cols = 2, ntrials = 1000)

## ----cecropia null distribution, fig.cap="Distribution of the differences between the proportions of red and white *Cecropia* trees with lianas obtained from 1000 simulations of the null hypothesis. The null hypothesis is that the proportion of infested trees are equal at the population from where the samples were drawn. The red line marks the difference observed in the samples and the gray area is the *acceptance region* of the null hypothesis."----
dplot(emb.r, svalue = emb.si(embauba), pside="Greater",
      main = "Frequency distribution of the statistic of interest under H0",
      xlab = "Statistic of interest")

## ----cecropia test-------------------------------------------------------
sum(emb.r >= emb.si(embauba))/1000 < 0.05

## ----inspecting object azteca--------------------------------------------
head(azteca)
summary(azteca)

## ----pairplot azteca, fig.cap = "Number ants that were recruited by aqueous extracts of young and old leaves of *Cecropia* trees. The extracts were dropped in paired leaves of *Cecropia* trees that had colonies of *Azteca* ants. The lines link leaves of same experimental pair."----
splot(azteca$extract.new, azteca$extract.old,
           groups.names=c("Young leaves","Old leaves"),
           ylab="Number of recruited ants",
           xlab="Extract type")

## ----statistics of interest azteca---------------------------------------
azt.si <- function(dataframe){
    diferencas <- with(dataframe, extract.new - extract.old)
    mean(diferencas)
}
## Observed value
azt.si(azteca)

## ----azteca resampling, results="hide"-----------------------------------
azt.r <- Rsampling(type = "within_rows", dataframe = azteca,
                   statistics = azt.si, cols = 2:3, ntrials = 1000)

## ----azteca null distribution, fig.cap="Frequency distributions of the difference of the number of ants recruited by the two types of extracts in 1000 simulations of the null hypothesis. The null hypothesis is that both extracts recruit ants equally. The red line marks the difference observed in the samples and the gray area is the *acceptance region* of the null hypothesis."----
dplot(azt.r, svalue = azt.si(azteca), pside="Greater",
      main = "Distribution of the statistic of interest under H0",
      xlab = "Statistic of interest")

## ----azteca test---------------------------------------------------------
sum(azt.r >= azt.si(azteca))/1000 < 0.05

## ----azteca two-tailed null, fig.cap="Frequency distributions of the difference of the number of ants recruited by the two types of extracts in 1000 simulations of the null hypothesis. The null hypothesis is that both extracts recruit ants equally. The red line marks the difference observed in the samples and the gray area is the *acceptance region* of the null hypothesis for a two-tailed test"----
dplot(azt.r, svalue = azt.si(azteca), pside="Two sided",
      main = "Two-tailed test",
      xlab = "Statistics of interest")

## ----inspecting the peucetia object--------------------------------------
head(peucetia)

## ----barplot peucetia, fig.cap = "Number of inspections each of 27 spiders were recorded on leaves with trichomes in a experiment of preference for two types of substrata (leaves with or without trichomes). The substrate of each spider was checked six times."----
## Number of records in leaves with trichomes
n.insp <- apply(peucetia, 1, sum)
barplot(table(factor(n.insp, levels=0:6)),
        xlab="Number of records in leaves with trichomes",
        ylab="Number of spiders")


## ----statistics of interest peucetia-------------------------------------
peu.si <- function(dataframe){
    mean(apply(dataframe, 1, sum))
}
## Observed value
peu.si(peucetia)

## ----peucetia H0---------------------------------------------------------
peu.H0 <- matrix( rep(c(TRUE,FALSE), each = 3),
                 nrow = nrow(peucetia), ncol = ncol(peucetia), byrow=TRUE)
## Converts in data.frame
peu.H0 <- data.frame(peu.H0)
## verifying
head(peu.H0)

## ----peucetia resampling, results="hide"---------------------------------
peu.r <- Rsampling(type = "within_rows", dataframe = peu.H0,
                   statistics = peu.si, ntrials = 1000, replace=TRUE)

## ----peucetia null distribution plot, fig.cap="Frequency distribution of the mean number of records of spiders on leaves with trichomes in 1000 simulations of the null hypothesis that there is no preference for substrata. The red line marks the observed average in the experiment and the gray area is the *acceptance region* of the null hypothesis."----
dplot(peu.r, svalue = peu.si(peucetia), pside="Greater",
      main = "Frequency distribution of the statistics of interest under H0",
      xlab = "Statistics of interest")

## ----peucetia test-------------------------------------------------------
sum(peu.r >= peu.si(peucetia))/1000 < 0.05

## ----peucetia n of inspections-------------------------------------------
## N of records in leaves with trichomes
tric <- apply(peucetia, 1, sum)
## N of records in leaves w/o trichomes
lisa <- apply(peucetia, 1, function(x) sum(x==0))
## Assembles a data frame with the vectors above
peu.H0b <- data.frame(tric=tric, lisa = lisa)
## Checking 1st lines
head(peu.H0b)

## ----peucetia statistics 2-----------------------------------------------
peu.si2 <- function(dataframe) mean(dataframe$tric)
## Checking, should be the same a previous calculation
peu.si2(peu.H0b)

## ----peucetia resampling 2, results="hide"-------------------------------
peu.r2 <- Rsampling(type = "within_rows", dataframe = peu.H0b,
                   statistics = peu.si2, ntrials = 1000)

## ----peucetia null distribution 2, fig.cap="Frequency distribution of the mean number of records of spiders on leaves with trichomes in 1000 simulations of the null hypothesis that there is no preference for substrata, but taking into account the tendency of spiders to stay put between inspections. The red line marks the observed average in the experiment and the gray area is the *acceptance region* of the null hypothesis."----
dplot(peu.r, svalue = peu.si(peucetia), pside="Greater")
dplot(peu.r2, svalue = peu.si2(peu.H0b), pside="Greater",
      main = "Frequency distribution of the statistic of interest under H0",
      xlab = "Statistic of interest")

## ----peucetia test 2-----------------------------------------------------
sum(peu.r2 >= peu.si(peucetia))/1000 < 0.05

## ----pielou inspecting---------------------------------------------------
pielou

## ----pielou brillouin index----------------------------------------------
brillouin <- function(x, base=10) {
    N <- sum(x)
    lfactorial(N)/(log(base)*N)  -  sum(lfactorial(x)/log(base))/N
}

## ----pielou statistics---------------------------------------------------
pielou.si <- function(dataframe)
    brillouin( dataframe ) - brillouin( apply(dataframe,2,sum) )

## ----pielou statistics value---------------------------------------------
pielou.si(pielou)

## ----pielou randomization, results="hide"--------------------------------
pielou.r1 <- Rsampling(type = "within_rows", dataframe = pielou,
                   statistics = pielou.si, ntrials = 1000, fix.zeroes = TRUE)

## ----pielou null 2, fig.cap="Frequency distribution of the niche overlap index of aphids in 1000 simulations of the null hypothesis that the associations of aphids and plant species are independent. Zeroes (plants without the record of each species) were kept fixed. The red line shows the observed value of niche overlap."----
dplot(pielou.r1, svalue = pielou.si(pielou), pside="Lesser",
      main = "Frequency distribution of statistics of interest under H0",
      xlab = "Statistics of interest", xlim=c(0.3,0.6))

## ----test 2--------------------------------------------------------------
sum(pielou.r1 <= pielou.si(pielou))/1000 < 0.05

