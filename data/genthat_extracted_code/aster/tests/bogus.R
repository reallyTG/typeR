
 library(aster)

 data(echinacea)

 # cut and paste from help(predict.aster)
 vars <- c("ld02", "ld03", "ld04", "fl02", "fl03", "fl04",
     "hdct02", "hdct03", "hdct04")
 redata <- reshape(echinacea, varying = list(vars), direction = "long",
     timevar = "varb", times = as.factor(vars), v.names = "resp")
 redata <- data.frame(redata, root = 1)
 pred <- c(0, 1, 2, 1, 2, 3, 4, 5, 6)
 fam <- c(1, 1, 1, 1, 1, 1, 3, 3, 3)
 hdct <- grepl("hdct", as.character(redata$varb))
 redata <- data.frame(redata, hdct = as.integer(hdct))
 level <- gsub("[0-9]", "", as.character(redata$varb))
 redata <- data.frame(redata, level = as.factor(level))
 aout <- aster(resp ~ varb + level : (nsloc + ewloc) + hdct : pop,
     pred, fam, varb, id, root, data = redata)
 # end of cut and paste from help(predict.aster)

 nind <- length(unique(redata$id))
 nnode <- length(pred)
 ncoef <- length(aout$coefficients)

 nind
 nnode
 ncoef

 mu <- predict(aout)
 mu <- matrix(mu, nrow = nind, ncol = nnode)

 my.xi <- matrix(NaN, nrow = nind, ncol = nnode)
 for (j in 1:nnode)
     if (pred[j] == 0) {
         my.xi[ , j] <- mu[ , j]
     } else {
         my.xi[ , j] <- mu[ , j] / mu[ , pred[j]]
     }

 old.xi <- predict(aout, model.type = "conditional")
 old.xi <- matrix(old.xi, nrow = nind, ncol = nnode)

 max(abs(my.xi - old.xi)) > 1.0

 # force use of method predict.aster rather than predict.aster.formula
 x.bogo <- matrix(1.0, nrow = nind, ncol = nnode)
 tricky.xi <- predict.aster(aout, x.bogo, x.bogo, aout$modmat,
     model.type = "conditional")
 tricky.xi <- matrix(tricky.xi, nrow = nind, ncol = nnode)
 all.equal(tricky.xi, my.xi)

 ### now use new feature !!!
 new.xi <- predict(aout, model.type = "conditional", is.always = TRUE)
 new.xi <- matrix(new.xi, nrow = nind, ncol = nnode)
 all.equal(new.xi, my.xi)

 # check gradient

 xpred <- old.xi / new.xi
 
 my.xpred <- matrix(NaN, nrow = nind, ncol = nnode)
 for (j in 1:nnode)
     if (pred[j] == 0) {
         my.xpred[ , j] <- 1
     } else {
         my.xpred[ , j] <- aout$x[ , pred[j]]
     }

 all.equal(xpred, my.xpred)

 pout.new <- predict(aout, model.type = "conditional", gradient = TRUE,
     is.always = TRUE)
 pout.old <- predict(aout, model.type = "conditional", gradient = TRUE)

 dim(pout.new$gradient)
 dim(pout.old$gradient)
 length(xpred)

 my.gradient.old <- sweep(pout.new$gradient, 1, as.vector(xpred), "*")
 all.equal(my.gradient.old, pout.old$gradient)

 ##### check conditional aster model #####

 aout <- aster(resp ~ varb + level : (nsloc + ewloc + pop),
     pred, fam, varb, id, root, data = redata, type = "conditional")

 old.xi <- predict(aout, model.type = "conditional")
 old.xi <- matrix(old.xi, nrow = nind, ncol = nnode)

 new.xi <- predict(aout, model.type = "conditional", is.always = TRUE)
 new.xi <- matrix(new.xi, nrow = nind, ncol = nnode)
 all.equal(xpred * new.xi, old.xi)

 pout.new <- predict(aout, model.type = "conditional", gradient = TRUE,
     is.always = TRUE)
 pout.old <- predict(aout, model.type = "conditional", gradient = TRUE)

 my.gradient.old <- sweep(pout.new$gradient, 1, as.vector(xpred), "*")
 all.equal(my.gradient.old, pout.old$gradient)

