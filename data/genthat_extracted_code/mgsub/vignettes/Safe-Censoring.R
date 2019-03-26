## ------------------------------------------------------------------------
library(mgsub)
string = "Time to flip this family into a fun pit of pudding!"
pattern = c("flip","family","fun")
replacement = vapply(pattern,function(x){
  paste(rep("*",nchar(x)),collapse="")
},FUN.VALUE = "")
mgsub(string,pattern,replacement)

## ------------------------------------------------------------------------
string = "Time to flip this family into a fun pit of pudding!"
pattern = c("f[^ ]*i[^ ]*","fun")
replacement = vapply(pattern,function(x){
  paste(rep("*",nchar(x)),collapse="")
},FUN.VALUE = "")
mgsub(string,pattern,replacement)

## ------------------------------------------------------------------------
string = "Time to flip this family into a fun pit of pudding!"
pattern = c("f[^ ]*i[^ ]*","fun")
mgsub::mgsub_censor(string = string,pattern = pattern,censor = "*")

## ------------------------------------------------------------------------
string = "Why don't you go flip a cookie?"
pattern = "flip"
censor = "?#!*"
print(mgsub::mgsub_censor(string,pattern,censor,split=TRUE))
print(mgsub::mgsub_censor(string,pattern,censor,split=TRUE))

## ------------------------------------------------------------------------
string = "Why don't you go flip a cookie?"
pattern = "flip"
censor = "?#!*"
mgsub::mgsub_censor(string,pattern,censor,split=TRUE,seed=1002)

## ------------------------------------------------------------------------
string = "Why don't you go flip a cookie?"
pattern = "flip"
censor = "?#!*"
mgsub::mgsub_censor(string,pattern,censor,split=FALSE)

## ------------------------------------------------------------------------
string = "Why don't you go flip a cookie?"
pattern = "flip"
censor = c("?","#","!","*")
print(mgsub::mgsub_censor(string,pattern,censor,split=TRUE))
print(mgsub::mgsub_censor(string,pattern,censor,split=FALSE))
print(mgsub::mgsub_censor(string,pattern,censor,seed=1002))

## ------------------------------------------------------------------------
string = "Why don't you go flip a cookie?"
pattern = "flip"
censor = c("?#","!*")
print(mgsub::mgsub_censor(string,pattern,censor,split=TRUE))
print(mgsub::mgsub_censor(string,pattern,censor,split=TRUE))
print(mgsub::mgsub_censor(string,pattern,censor,split=TRUE,seed=1002))

## ------------------------------------------------------------------------
string = "Why don't you go flip a cookie?"
pattern = "flip"
censor = c("?#","!*")
mgsub::mgsub_censor(string,pattern,censor,split=FALSE)

## ------------------------------------------------------------------------
string = "I'm selling 100 kilograms of bleach for $20/kilo"
pattern = c("kilo","kilogram")
censor = "*"
mgsub::mgsub_censor(string,pattern,censor)

## ------------------------------------------------------------------------
library(microbenchmark)

mgsub_test = function(){
  string = "Time to flip this family into a fun pit of pudding!"
  pattern = c("flip","family","fun")
  replacement = vapply(pattern,function(x){
    paste(rep("*",nchar(x)),collapse="")
  },FUN.VALUE = "")
  mgsub::mgsub(string,pattern,replacement)
}

mgsub_censor_test = function(){
  string = "Time to flip this family into a fun pit of pudding!"
  pattern = c("flip","family","fun")
  mgsub::mgsub_censor(string,pattern,"*")
}

microbenchmark(
  mgsub = mgsub_test(),
  mgsub_censor = mgsub_censor_test()
)

