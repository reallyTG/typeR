library(MaskJointDensity)


### Name: unmask
### Title: First core function used by End-User
### Aliases: unmask
### Keywords: ~kwd1 ~kwd2

### ** Examples

##---- Should be DIRECTLY executable !! ----
##-- ==>  Define data, use random,
##--	or do  help(data=index)  for the standard data sets.
## No test: 
#Example 1:
set.seed(123)
n=10000

y <- rmulti(n=10000, mean=c(30, 50), sd=c(4,2), p=c(0.3, 0.7))
      # y is a sample drawn from Y.
noise<-rmulti(n=10000, mean=c(80, 100), sd=c(5,3), p=c(0.6, 0.4))
      # noise is a sample drawn from C.


a1<-runif(1, min=min(y)-2,max=min(y))
b1<-runif(1, min=max(y), max=max(y)+2)
ymask<-mask(vectorToBeMasked=y, noisefile=file.path(tempdir(),"noise.bin"), noise,
lowerBoundAsGivenByProvider=a1, upperBoundAsGivenByProvider=b1)
write(ymask$ystar, file.path(tempdir(),"ystar.dat")) # Create masked data and noise.bin.
         # The two files can be issued to the public. 
                                

      # After received the two files "ystar.dat" and
      # noise.bin, the data user can use the following code to 
      # obtain the synthetic data of the original data. 

ystar <- scan(file.path(tempdir(),"ystar.dat"))
y1 <- unmask(maskedVectorToBeUnmasked=ystar, noisefile=file.path(tempdir(),"noise.bin"))
sample<-y1$unmaskedVariable
   # y1$unmaskedVariable gives the  synthetic data of the
   # original data y.  The size of the synthetic data is  the
   # same as that of y
plot(density(y1$unmaskedVariable), main="density(ymask)", xlab="y")
   # the plot of the approximant of $f_Y$
## End(No test)
#Example 2:
## No test: 
set.seed(124)
n<-2000
a<-170
b<-80
y<-rbinom(n, 1, 0.1)+1
noise<-(a+b)/2+ sqrt(1+(a-b)^2/4)*rnorm(n, 0,1)
noise[noise<0]<- - noise[noise<0]

ymask<-mask(vectorToBeMasked=factor(y), noisefile=file.path(tempdir(),"noise.bin"), noise,
lowerBoundAsGivenByProvider=0,upperBoundAsGivenByProvider=3)
      # using factor(y) because y is a categorical variable
write(ymask$ystar, file.path(tempdir(),"ystar.dat"))

ystar<-scan(file.path(tempdir(),"ystar.dat"))
y1 <- unmask(maskedVectorToBeUnmasked=ystar, noisefile=file.path(tempdir(),"noise.bin"))
unmaskY<-y1$unmaskedVariable  # synthetic data
mass_function<-y1$prob  # estimated mass function
## End(No test)



