library(klausuR)


### Name: plot
### Title: Plot methods for S4 objects of class klausuR and klausuR.mult
### Aliases: plot plot,-methods plot,klausuR,missing,ANY-method
###   plot,klausuR,missing-method plot,klausuR-method
###   plot,klausuR.mult,missing,ANY-method plot,klausuR.mult,missing-method
###   plot,klausuR.mult-method
### Keywords: methods plot

### ** Examples

data(antworten)

# vector with correct answers:
richtig <- c(Item01=3, Item02=2, Item03=2, Item04=2, Item05=4,
 Item06=3, Item07=4, Item08=1, Item09=2, Item10=2, Item11=4,
 Item12=4, Item13=2, Item14=3, Item15=2, Item16=3, Item17=4,
 Item18=4, Item19=3, Item20=5, Item21=3, Item22=3, Item23=1,
 Item24=3, Item25=1, Item26=3, Item27=5, Item28=3, Item29=4,
 Item30=4, Item31=13, Item32=234)

# vector with assignement of marks:
notenschluessel <- c()
# scheme of assignments: marks[points_from:to] <- mark
notenschluessel[0:12]  <- 5.0
notenschluessel[13:15] <- 4.0
notenschluessel[16:18] <- 3.7
notenschluessel[19:20] <- 3.3
notenschluessel[21]    <- 3.0
notenschluessel[22]    <- 2.7
notenschluessel[23]    <- 2.3
notenschluessel[24]    <- 2.0
notenschluessel[25:26] <- 1.7
notenschluessel[27:29] <- 1.3
notenschluessel[30:32] <- 1.0

data.obj <- klausur.data(answ=antworten, corr=richtig, marks=notenschluessel)
klsr.obj <- klausur(data.obj)
plot(klsr.obj, marks=TRUE)



