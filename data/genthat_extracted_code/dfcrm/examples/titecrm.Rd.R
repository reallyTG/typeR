library(dfcrm)


### Name: titecrm
### Title: Executing the TITE-CRM
### Aliases: titecrm crmht crmht2 crmht2lgt crmhtlgt
### Keywords: datasets

### ** Examples


# Create a simple data set
prior <- c(0.05, 0.10, 0.20, 0.35, 0.50, 0.70)
target <- 0.2
level <- c(3, 3, 3, 4, 4, 3, 2, 2, 2, 3)
y <- c(0, 0, 1, 0, 1, 0, 0, 0, 0, 0)
u <- c(178, 181, 168, 181, 24, 181, 179, 102, 42, 3)
tau <- 180
foo <- titecrm(prior, target, y, level, followup=u, obswin=tau)
rec <- foo$mtd  # recommend a dose level for next patient

# An example with adaptive weight
foo2 <- titecrm(prior, target, y, level, followup=u, obswin=tau, scheme="adaptive")
wts <- foo2$weights

# The `weights' argument makes `followup' and `obswin' obsolete
foo3 <- titecrm(prior, target, y, level, weights=wts, followup=u, obswin=tau)
## Not run: plot(foo3, ask=T)

## Patient time information via `entry' and `exit' arguments
# entry time (days since study begins)
entry <- c(7, 29, 49, 76, 92, 133, 241, 303, 363, 402)
# exit time (days since study begins)
exit <- c(185, 210, 217, 257, 116, 314, 420, 405, 405, 405)
foo4 <- titecrm(prior, target, y, level, exit=exit, entry=entry, obswin=tau)
## Not run: plot(foo4, ask=T)




