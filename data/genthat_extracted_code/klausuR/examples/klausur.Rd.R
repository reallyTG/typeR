library(klausuR)


### Name: klausur
### Title: Evaluate multiple choice tests
### Aliases: klausur
### Keywords: misc

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

# now combine all test data into one object of class klausur.answ
data.obj <- klausur.data(answ=antworten, corr=richtig, marks=notenschluessel)

# if that went well, get the test results
klsr.obj <- klausur(data.obj)

# to try pick-n scoring, we must also define all distractors
falsch <- c(Item01=1245, Item02=1345, Item03=1345, Item04=1345, Item05=1235,
 Item06=1245, Item07=1235, Item08=2345, Item09=1345, Item10=1345, Item11=1235,
 Item12=1235, Item13=1345, Item14=1245, Item15=1345, Item16=1245, Item17=1235,
 Item18=1235, Item19=1245, Item20=1234, Item21=1245, Item22=1245, Item23=2345,
 Item24=1245, Item25=2345, Item26=1245, Item27=1234, Item28=1245, Item29=1235,
 Item30=1235, Item31=245, Item32=15)

data.obj <- klausur.data(answ=antworten, corr=richtig, wrong=falsch,
      marks=notenschluessel)
klsr.obj <- klausur(data.obj, score="pick-n")

############################
 # example for an NRET test
############################
# load sampla data in SPSS format
data(spss.data)
# define correct answers
spss.corr <- c(
   item01=2, item02=3, item03=3, item04=3, item05=2,
   item06=2, item07=3, item08=1, item09=1, item10=2)

# convert into klausuR type coding
klausuR.data <- nret.translator(spss.data, spss="in")
klausuR.corr <- nret.translator(spss.corr, spss="in", corr=TRUE,
  num.alt=3, spss.prefix=c(corr="item"))
# now create the data object; "Nickname" must be renamed
data.obj <- klausur.data(answ=klausuR.data, corr=klausuR.corr,
  rename=c(Pseudonym="Nickname"))

 # finally, the test can be evaluated, using the scoring functions available
NRET.results <- klausur(data.obj, marks="suggest", mark.labels=11, score="NRET")
NRETplus.results <- klausur(data.obj, marks="suggest", mark.labels=11, score="NRET+")
NR.results <- klausur(data.obj, marks="suggest", mark.labels=11, score="NR")
ET.results <- klausur(data.obj, marks="suggest", mark.labels=11, score="ET")



