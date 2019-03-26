library(phylosim)


### Name: setRate.QMatrix
### Title: Set an unscaled rate in a QMatrix object
### Aliases: setRate.QMatrix QMatrix.setRate setRate,QMatrix-method

### ** Examples

       # create a QMatrix object
       # provide an Alphabet object and the rates
       m<-QMatrix(alphabet=BinaryAlphabet(), rate.list=list("1->0"=1,"0->1"=1))
       # set the unscaled rate by event name
       setRate(m,"0->1",2)
       # get the unscaled rate of "0->1" by name
       getRate(m,"0->1")     
       # set the unscaled rate by states
       setRate(m,"0->1",0.5)
       # set the unscaled rate of "0->1" by states
       setRate(m,"0->1",0.5)
       # get the unscaled rate of "0->1" by states
       getRate(m,from="0",to="1")
 


