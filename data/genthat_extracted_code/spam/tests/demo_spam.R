# HEADER ####################################################
# This is file spam/tests/demo_spam.R.                      #
# It is part of the R package spam,                         #
#  --> https://CRAN.R-project.org/package=spam              #
#  --> https://CRAN.R-project.org/package=spam64            #
#  --> https://git.math.uzh.ch/reinhard.furrer/spam         #
# by Reinhard Furrer [aut, cre], Florian Gerber [aut],      #
#    Roman Flury [aut], Daniel Gerber [ctb],                #
#    Kaspar Moesinger [ctb]                                 #
# HEADER END ################################################


# This is a simple demo, wrapping up the functionality of spam.
options( echo=FALSE)
library( spam, warn.conflict=FALSE)


set.seed(14)

nrow <- 5
ncol <- 7
fmat <- matrix(rnorm(nrow*ncol),nrow)
smat <- as.spam(fmat)


smat[1,]
smat[,1] <- 0
as.spam(smat)


ssmat <- smat %*% t(smat)

b <- c(-2:2)

solve(ssmat,b)

cholssmat <- chol(ssmat)


# works also for large matrices:

set.seed(14)

nz <- 100
nrow <- 100
ncol <- 100
smat <- diag.spam(1,nrow,ncol)

smat[cbind(sample(1:(nrow*ncol),size=nz))] <- runif(nz)

smat <- smat %*% t(smat)




b <- rnorm(nz)

smatinvb <- solve(smat,b)

cholssmat <- chol(smat)


# displaying matrices
if (F) {
opar <- par(no.readonly = TRUE)
par(ask=interactive() &&
            (.Device %in% c("X11","GTK","gnome","windows","quartz")))

display(smat, main="'scatterplot'-type display, very efficient")



options(spam.imagesize=prod(smat@dimension)+1)
display(smat, main="'image'-type display, may be slow and heavy")

par(opar)


}
options( echo=TRUE)
