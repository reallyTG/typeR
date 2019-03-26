## ---- echo=FALSE, results='asis'-----------------------------------------
library(assertable)

## ---- results='asis', eval=FALSE-----------------------------------------
#  for(i in 1:3) {
#    data <- CO2
#    data$id_var <- i
#    write.csv(data,file=paste0("../data/file_",i,".csv"),row.names=F)
#  }

## ---- results='markup'---------------------------------------------------
files <- paste0("file_",c(1:3),".csv")
filenames <- system.file("extdata", files, package = "assertable")
filenames

## ---- results='markup', error=TRUE---------------------------------------
check_files(filenames)

## ---- results='markup', error=TRUE---------------------------------------
filenames <- c(filenames,"new_file.csv")
check_files(filenames)

## ---- results='markup', error=TRUE---------------------------------------
filenames <- c(filenames,"new_file.csv")
check_files(filenames, continual=T, sleep_time = 1, sleep_end = .10)

## ---- results='markup', error=TRUE---------------------------------------
filenames <- c(filenames,"new_file_1.csv","new_file_2.csv")
check_files(filenames, display_pct=50)

## ---- results='markup'---------------------------------------------------
library(data.table)
files <- paste0("file_",c(1:3),".csv")
filenames <- system.file("extdata", files, package = "assertable")
data <- import_files(filenames, FUN=fread)
data

## ---- results='markup'---------------------------------------------------
data <- import_files(filenames, FUN=read.csv, stringsAsFactors=F)
data

## ---- results='markup', error=TRUE---------------------------------------
filenames <- c(filenames,paste0("new_file_",c(1:10),".csv"))
import_files(filenames)

