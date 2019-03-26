library(BMisc)


### Name: makeBalancedPanel
### Title: makeBalancedPanel
### Aliases: makeBalancedPanel

### ** Examples

id <- rep(seq(1,100,1),2) ## individual ids for setting up a two period panel
t <- rep(seq(1,2),100) ## time periods
y <- rnorm(200) ## outcomes
dta <- data.frame(id=id, t=t, y=y) ## make into data frame
dta <- dta[-7,] ## drop the 7th row from the dataset (which creates an unbalanced panel)
dta <- makeBalancedPanel(dta, idname="id", tname="t")




