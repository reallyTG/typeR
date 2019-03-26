library(phylosim)


### Name: getRate.QMatrix
### Title: Get an unscaled rate of an event from a QMatrix object
### Aliases: getRate.QMatrix QMatrix.getRate getRate,QMatrix-method

### ** Examples

       # create a QMatrix object
       # provide an Alphabet object and the rates
       m<-QMatrix(alphabet=BinaryAlphabet(), rate.list=list("1->0"=1,"0->1"=1))
       # get the unscaled rate of "0->1" by name
       getRate(m,"0->1")     
       # get the unscaled rate of "0->1" by states
       getRate(m,from="0",to="1")
 


