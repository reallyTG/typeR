library(phylosim)


### Name: getEventRate.QMatrix
### Title: Get the unscaled rate of an event from a QMatrix object
### Aliases: getEventRate.QMatrix QMatrix.getEventRate
###   getEventRate,QMatrix-method

### ** Examples

       # create a QMatrix object
       # provide an Alphabet object and the rates
       m<-QMatrix(alphabet=BinaryAlphabet(), rate.list=list("0->1"=1,"1->0"=1))
       # get the unscaled rate of "0->1" by name
       getEventRate(m,"0->1")  # retruns NA
       # get the unscaled rate of "0->1" by states
       getEventRate(m,from="0",to="1")	# returns NA
 


