library(BSDA)


### Name: Vaccine
### Title: Reported serious reactions due to vaccines in 11 southern states
### Aliases: Vaccine
### Keywords: datasets

### ** Examples


stem(Vaccine$number, scale = 2) 
fn <- fivenum(Vaccine$number)
fn
iqr <- IQR(Vaccine$number)
iqr




