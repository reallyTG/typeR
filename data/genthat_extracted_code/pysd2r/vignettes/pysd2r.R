## ---- eval=F-------------------------------------------------------------
#  library(pysd2r)  # load pysd2r
#  library(ggplot2) # load ggplot2
#  library(tibble)  # load tibble

## ---- eval=F-------------------------------------------------------------
#  py <- pysd_connect()

## ---- eval=F-------------------------------------------------------------
#  target <- system.file("models/vensim", "Population.mdl", package = "pysd2r")
#  py <- read_vensim(py, target)

## ---- eval=F-------------------------------------------------------------
#  str(py)

## ---- eval=F-------------------------------------------------------------
#  results <- run_model(py)

## ---- eval=F-------------------------------------------------------------
#  results

## ---- eval=F-------------------------------------------------------------
#  ggplot(data=results)+
#    geom_point(aes(x=TIME,y=Population),colour="blue")

