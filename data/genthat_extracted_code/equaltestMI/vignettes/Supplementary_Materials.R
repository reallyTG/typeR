## ----cars, message=FALSE-------------------------------------------------
## load package
library(equaltestMI)

## ------------------------------------------------------------------------
## sample statistics where M1 and M2 are sample means, and Cov1 and Cov2 are sample covariance matrices;
## group 1 = boys ineligible for free-reduced lunches
## group 2 = boys eligible for free-reduced lunches

#setwd("C:/research/equaltestMI")
Group1 <- read.table('Group1.txt', header = TRUE)
Group2 <- read.table('Group2.txt', header = TRUE)
Group1 <- as.matrix(Group1)
Group2 <- as.matrix(Group2)
M1 <- Group1[1,]
M2 <- Group2[1,]
Cov1 <- Group1[2:7,]
Cov2 <- Group2[2:7,]

## ------------------------------------------------------------------------
## lavaan model syntax
model <- '
AlphabetKnowledge =~ Letter_Name+ Letter_Sound
PhonologicalAwareness =~ Blending + Elision
Spelling =~ Real_Words + Pseudo_Words
'

## ---- eval=FALSE---------------------------------------------------------
#  ## the results using equivalence testing and projection method
#  ## full R output will be presented in Part 3
#  
#  test <- eqMI.main(model = model,
#  	sample.nobs = c(78, 174),
#  	sample.mean = list(M1, M2),
#  	sample.cov = list(Cov1, Cov2),
#  	meanstructure = TRUE,
#  	output = 'both',
#  	quiet = FALSE, 	
#  	equivalence.test = TRUE, adjRMSEA = TRUE,
#  	projection = TRUE, bootstrap = FALSE)

## ---- echo=FALSE---------------------------------------------------------
M1

## ---- echo=FALSE---------------------------------------------------------
round(Cov1, 3)

## ---- echo=FALSE---------------------------------------------------------
M2

## ---- echo=FALSE---------------------------------------------------------
round(Cov2, 3)

## ---- echo=FALSE---------------------------------------------------------
## the results using equivalence testing and projection method
test <- eqMI.main(model = model, 
	sample.nobs = c(78, 174), 
	sample.mean = list(M1, M2), 
	sample.cov = list(Cov1, Cov2),
	meanstructure = TRUE, 
	output = 'both', 
	quiet = FALSE, 	
	equivalence.test = TRUE, adjRMSEA = TRUE, 
	projection = TRUE, bootstrap = FALSE)

## ---- eval=FALSE---------------------------------------------------------
#  test1 <- eqMI.main(model = model,
#  	sample.nobs = c(78, 174), sample.cov = list(Cov1, Cov2),
#  	sample.mean = list(M1, M2), meanstructure = TRUE,
#  	equivalence.test = FALSE, adjRMSEA = FALSE)

## ---- eval=FALSE---------------------------------------------------------
#  test2 <- eqMI.main(model = model,
#  	sample.nobs = c(78, 174), sample.cov = list(Cov1, Cov2),
#  	sample.mean = list(M1, M2), meanstructure = TRUE,
#  	equivalence.test = FALSE, adjRMSEA = FALSE,
#  	projection = TRUE)

## ---- eval=FALSE---------------------------------------------------------
#  test3 <- eqMI.main(model = model,
#  	sample.nobs = c(78, 174), sample.cov = list(Cov1, Cov2),
#  	sample.mean = list(M1, M2), meanstructure = TRUE,
#  	equivalence.test = TRUE, adjRMSEA = FALSE)

## ---- eval=FALSE---------------------------------------------------------
#  test4 <- eqMI.main(model = model,
#  	sample.nobs = c(78, 174), sample.cov = list(Cov1, Cov2),
#  	sample.mean = list(M1, M2), meanstructure = TRUE,
#  	equivalence.test = TRUE, adjRMSEA = TRUE)

## ---- eval=FALSE---------------------------------------------------------
#  test5 <- eqMI.main(model = model,
#  	sample.nobs = c(78, 174), sample.cov = list(Cov1, Cov2),
#  	sample.mean = list(M1, M2), meanstructure = TRUE,
#  	equivalence.test = TRUE, adjRMSEA = TRUE,
#  	projection = TRUE)

## ---- eval=FALSE---------------------------------------------------------
#  test6 <- eqMI.main(model = model, structure = 'mean',
#  	sample.nobs = c(78, 174), sample.cov = list(Cov1, Cov2),
#  	sample.mean = list(M1, M2), meanstructure = TRUE,
#  	equivalence.test = TRUE, adjRMSEA = TRUE,
#  	projection = TRUE)

## ---- eval=FALSE---------------------------------------------------------
#  test7 <- eqMI.main(model = model, data = literacy.dat,
#  	group = "FRL", meanstructure = TRUE,
#  	equivalence.test = TRUE, adjRMSEA = TRUE,
#  	projection = TRUE)

## ---- eval=FALSE---------------------------------------------------------
#  #test8 <- eqMI.main(model = model, data = literacy.dat,
#  #	group = "FRL", meanstructure = TRUE,
#  #	equivalence.test = TRUE, adjRMSEA = TRUE,
#  #	projection = TRUE, bootstrap = TRUE)

## ---- eval=FALSE---------------------------------------------------------
#  test9 <- eqMI.main(model = model, data = literacy.dat,
#  	group = "FRL", meanstructure = TRUE,
#  	equivalence.test = TRUE, adjRMSEA = TRUE,
#  	projection = TRUE, bootstrap = FALSE,
#  	quite = TRUE)

## ---- echo=FALSE---------------------------------------------------------
help_console <- function(topic, format=c("text", "html", "latex", "Rd"),
                         lines=NULL, before=NULL, after=NULL, package = NULL) {  
  format=match.arg(format)
  if (!is.character(topic)) topic <- deparse(substitute(topic))
  helpfile = utils:::.getHelpFile(help(topic, package = (package)))

  hs <- capture.output(switch(format, 
                              text=tools:::Rd2txt(helpfile),
                              html=tools:::Rd2HTML(helpfile),
                              latex=tools:::Rd2latex(helpfile),
                              Rd=tools:::prepare_Rd(helpfile)
                              )
                      )
  if(!is.null(lines)) hs <- hs[lines]
  hs <- c(before, hs, after)
  cat(hs, sep="\n")
  invisible(hs)
}
#help_console(eqMI.main, package = 'equaltestMI')

