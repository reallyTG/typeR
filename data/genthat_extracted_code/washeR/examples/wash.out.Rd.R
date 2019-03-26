library(washeR)


### Name: wash.out
### Title: Time Series Outlier Detection (washer)
### Aliases: wash.out

### ** Examples

## data without outliers but structured with co-movement between groups
data("dati")
## first column for phenomenon
## 2° col for time written in ordered number or strings
## 3° col for group classification variable
## 4° col for values
str(dati)
## 1° -> data.frame + no outlier
out=wash.out(dati)
out
length(out[,1])
## add two outliers
####  time=3 temperature value=0
dati[99,4]=  0
## ... and after for "rain" phenomenon!
####  time=3 rain value=37
dati[118,4]=  37
##  2° -> data.frame + 2 outliers
out=wash.out(dati)
##  all "three terms" time series
## let's take a look at anomalous time series
out
## ... the same but save results in a specified file....
## If you don't specify the file the name is by default "out.csv"
out=wash.out(dati,save_out=TRUE,out_out="tabel_out.csv")
out
## put the limit from 5 to 10 to capture only the worst outliers
out=wash.out(dati, val_test_limit = 10  )
out
## save plots and outliers in a pdf file "out.pdf" as a default
out=wash.out(dati, val_test_limit = 10,graph=TRUE)
out
## make the usual analysis for groups but also that for every single time series
## (linear_analysis): two files for saved outliers ("out.csv" and "linout.csv")
##  and for graph display in two pdf files ("out.pdf" and "linout.pdf")
out=wash.out(dati, val_test_limit = 5, save_out=TRUE,
          linear_analysis=TRUE  ,graph=TRUE)
out
## out return only the second linear analysis...
##########################################################
##  single time series analysis
##########################################################
data(ts)
str(ts)
dati= ts$dati
plot(dati,type="b",pch=20,col="red")
## a time series with a variability and an increasing trend
## dati is a vector and linear analysis is a default
out=wash.out(dati)
out
## no outlier
out=wash.out(dati, val_test_limit = 5,linear_analysis=TRUE   ,graph=TRUE)
out
## no outlier
## add an outlier with limited amount
dati[5]=dati[5]*2
plot(dati,type="b",pch=20,col="red")
out=wash.out(dati, val_test_limit = 5)
out
## test is over 5 for a bit
out=wash.out(dati, val_test_limit = 5,save_out=TRUE ,graph=TRUE)
out
data(ts)
dati= ts$dati
dati[5]=dati[5]*3
## try a greater outlier
plot(dati,type="b",pch=20,col="blue")
out=wash.out(dati, val_test_limit = 5,save_out=TRUE ,graph=TRUE)
out
## washer identify three triads of possible outliers



