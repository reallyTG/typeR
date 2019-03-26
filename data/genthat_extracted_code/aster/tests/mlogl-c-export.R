
# copied from ../man/aster.Rd examples section

 library(aster)
 data(echinacea)
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

# redo with new function

 theta <- predict(aout, parm.type = "canonical", model.type = "conditional")
 phi <- predict(aout, parm.type = "canonical", model.type = "unconditional")

 nind <- nrow(echinacea)
 nnode <- length(pred)

 aster:::setfam(fam.default())

 val.theta <- .C(aster:::C_aster_export_exerciser,
     nind = as.integer(nind),
     nnode = as.integer(nnode),
     pred = as.integer(pred),
     fam = as.integer(fam),
     parm = as.double(theta),
     root = as.double(redata$root),
     response = as.double(redata$resp),
     is.unco = FALSE,
     value = double(1))$value

 val.phi <- .C(aster:::C_aster_export_exerciser,
     nind = as.integer(nind),
     nnode = as.integer(nnode),
     pred = as.integer(pred),
     fam = as.integer(fam),
     parm = as.double(phi),
     root = as.double(redata$root),
     response = as.double(redata$resp),
     is.unco = TRUE,
     value = double(1))$value

 aster:::clearfam()

 all.equal(val.theta, aout$deviance / 2)
 all.equal(val.phi, aout$deviance / 2)

