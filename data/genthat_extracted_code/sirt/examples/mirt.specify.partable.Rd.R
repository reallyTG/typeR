library(sirt)


### Name: mirt.specify.partable
### Title: Specify or modify a Parameter Table in 'mirt'
### Aliases: mirt.specify.partable
### Keywords: mirt

### ** Examples

#############################################################################
# EXAMPLE 1: Modifying a parameter table for single group
#############################################################################

library(mirt)
data(LSAT7,package="mirt")
data <- mirt::expand.table(LSAT7)

mirt.partable <- mirt::mirt(data, 1, pars="values")
colnames(mirt.partable)
## > colnames(mirt.partable) [1] 'group' 'item' 'class' 'name' 'parnum' 'value'
##   'lbound' 'ubound' 'est' 'prior.type' 'prior_1' 'prior_2'

# specify some values of item parameters
value <- data.frame(d=c(0.7, -1, NA), a1=c(1, 1.2, 1.3), g=c(NA, 0.25, 0.25))
rownames(value) <- c("Item.1", "Item.4", "Item.3")

# fix some item paramters
est1 <- data.frame(d=c(TRUE, NA), a1=c(FALSE, TRUE))
rownames(est1) <- c("Item.4", "Item.3")

# estimate all guessing parameters
est2 <- data.frame(g=rep(TRUE, 5))
rownames(est2) <- colnames(data)

# prior distributions
prior.type <- data.frame(g=rep("norm", 4))
rownames(prior.type) <- c("Item.1", "Item.2", "Item.4", "Item.5")
prior_1 <- data.frame(g=rep(-1.38, 4))
rownames(prior_1) <- c("Item.1", "Item.2", "Item.4", "Item.5")
prior_2 <- data.frame(g=rep(0.5, 4))
rownames(prior_2) <- c("Item.1", "Item.2", "Item.4", "Item.5")

# misspecify some entries
rownames(prior_2)[c(3,2)] <- c("A", "B")
rownames(est1)[2] <- c("B")

# define complete list with parameter specification
parlist <- list(value=value, est=est1, est=est2, prior.type=prior.type,
      prior_1=prior_1, prior_2=prior_2)

# modify parameter table
mirt.specify.partable(mirt.partable, parlist)



