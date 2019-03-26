library(poweRlaw)


### Name: dist_pdf
### Title: The probability density function (pdf)
### Aliases: dist_pdf dist_pdf,conexp-method dist_pdf,conlnorm-method
###   dist_pdf,conpl-method dist_pdf,conweibull-method
###   dist_pdf,disexp-method dist_pdf,dislnorm-method dist_pdf,displ-method
###   dist_pdf,dispois-method

### ** Examples

##########################################
#Create distribution object              #
##########################################
m = displ$new()
m$setXmin(7); m$setPars(2)

##########################################
#Calculate the pdf at particular values  #
##########################################
dist_pdf(m, 7:10)



