library(lordif)


### Name: lordif
### Title: performs Logistic Ordinal Regression Differential Item
###   Functioning using IRT
### Aliases: lordif

### ** Examples

  ## Not run: data(Anxiety)
  ## Not run: resp.data <- Anxiety[paste("R",1:29,sep="")]
  ## Not run: age <- Anxiety$age
  ## Not run: age.DIF <- lordif(resp.data,age,model="GPCM",anchor=c(1:5,7,8,10,12:17,19:23,25:29))
  ## Not run: print(age.DIF)



