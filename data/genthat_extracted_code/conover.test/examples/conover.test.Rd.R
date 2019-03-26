library(conover.test)


### Name: conover.test
### Title: Conover-Iman Test
### Aliases: 'Conover-Iman test' conover.test p.adjustment.methods
### Keywords: htest nonparametric stats

### ** Examples

## Example cribbed and modified from the kruskal.test documentation
## Hollander & Wolfe (1973), 116.  
## Mucociliary efficiency from the rate of removal of dust in normal
##  subjects, subjects with obstructive airway disease, and subjects
##  with asbestosis.  
x <- c(2.9, 3.0, 2.5, 2.6, 3.2) # normal subjects
y <- c(3.8, 2.7, 4.0, 2.4)      # with obstructive airway disease
z <- c(2.8, 3.4, 3.7, 2.2, 2.0) # with asbestosis
conover.test(x=list(x,y,z))

x <- c(x, y, z)
g <- factor(rep(1:3, c(5, 4, 5)),
            labels = c("Normal",
                       "COPD",
                       "Asbestosis"))
conover.test(x, g)

## Example based on home care data from Dunn (1964)
data(homecare)
attach(homecare)
conover.test(occupation, eligibility, method="hs", list=TRUE)
detach(homecare)

## Air quality data set illustrates differences in different
## multiple comparisons adjustments
attach(airquality)
conover.test(Ozone, Month, kw=FALSE, method="bonferroni")
conover.test(Ozone, Month, kw=FALSE, method="hs")
conover.test(Ozone, Month, kw=FALSE, method="bh")
detach(airquality)



