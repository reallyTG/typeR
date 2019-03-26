library(MuViCP)


### Name: combine.ds
### Title: Combining Basic Probability Assignments
### Aliases: combine.bs combine.ds combine.bpa.bs combine.bpa.ds
###   combine.bpa.list.bs combine.bpa.list.ds combine.bpamat.bs
###   combine.bpamat.ds combine.bpamat.list.bs combine.bpamat.list.ds

### ** Examples

##Very Strong, Consistent Testimony
vstrong <- c(0.85, 0.07, 0.08)
##Strong, Consistent Testimony
strong <- c(0.7, 0.15, 0.15)
##Somewhat Ambiguous Testimony
amb <- c(0.55, 0.40, 0.05)
##More Diffuse Testimony
amb2 <- c(0.55, 0.20, 0.25)

fn_gen <- function(par)
{
    x <- gtools::rdirichlet(2, par)
    y <- x
    y <- t(apply(y, MARGIN = 1, FUN = function(x) x * 0.9))
    y <- cbind(y, 0.1)
    return(y)
}

a1 <- fn_gen(vstrong)
combine.bs(a1[1,], a1[2,])
combine.ds(a1[1,], a1[2,])

a2 <- fn_gen(strong)
combine.bs(a2[1,], a2[2,])
combine.ds(a2[1,], a2[2,])

a3 <- fn_gen(amb)
combine.bs(a3[1,], a3[2,])
combine.ds(a3[1,], a3[2,])

a4 <- fn_gen(amb2)
combine.bs(a4[1,], a4[2,])
combine.ds(a4[1,], a4[2,])

##For bpa or bpamat examples, see the relevant help files



