library(phylosim)


### Name: setRateList.QMatrix
### Title: Setting the unscaled rates stored in a QMatrix object
### Aliases: setRateList.QMatrix QMatrix.setRateList
###   setRateList,QMatrix-method

### ** Examples

       # create a GeneralSubstitution object
       # provide an Alphabet object and the rates
       p<-GeneralSubstitution(alphabet=BinaryAlphabet(), rate.list=list("1->0"=1,"0->1"=3))
	# get the QMatrix object from p
	m<-p$QMatrix
       # get the event rates from the unscaled Q matrix
       getRateList(m)
       # get rates from the unscaled rate matrix via virtual field
       m$rateList
       # set rates in the unscaled rate matrix
       setRateList(m, list("0->1"=1,"1->0"=1))
       m$rateList
       # set rates in the unscaled rate matrix via virtual field
       m$rateList<-list("0->1"=3,"1->0"=1);
	m$rateList
 


