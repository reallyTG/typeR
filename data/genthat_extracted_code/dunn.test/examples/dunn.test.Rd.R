library(dunn.test)


### Name: dunn.test
### Title: Dunn's Test
### Aliases: 'Dunn's test' dunn.test p.adjustment.methods
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
dunn.test(x=list(x,y,z))

x <- c(x, y, z)
g <- factor(rep(1:3, c(5, 4, 5)),
            labels = c("Normal",
                       "COPD",
                       "Asbestosis"))
dunn.test(x, g)

## Example based on home care data from Dunn (1964)
data(homecare)
attach(homecare)
dunn.test(occupation, eligibility, method="hs", list=TRUE)

## Air quality data set illustrates differences in different
## multiple comparisons adjustments
attach(airquality)
dunn.test(Ozone, Month, kw=FALSE, method="bonferroni")
dunn.test(Ozone, Month, kw=FALSE, method="hs")
dunn.test(Ozone, Month, kw=FALSE, method="bh")
detach(airquality)



