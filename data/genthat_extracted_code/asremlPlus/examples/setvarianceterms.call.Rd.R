library(asremlPlus)


### Name: setvarianceterms.call
### Title: allows the seting of bounds and initial values for terms in the
###   'random' and 'residual' arguments of an 'asreml' call, with the
###   resulting call being evaluated.
### Aliases: setvarianceterms.call setvarianceterms
### Keywords: asreml

### ** Examples
## Not run: 
##D    m1.call <- call("asreml", 
##D                    fixed = Height ~ (Block + Irrig)*csDay.num,
##D                    random= ~ spl(csDay.num)/(Irrig+Block)
##D                              + dev(csDay.num)
##D                              + str(~Block:Plot/csDay.num, ~us(2):id(20)) 
##D                              + Block:Plot:spl(csDay.num),
##D                    data=quote(dat)) ##use quote to stop evaluation of dat here 
##D    terms <- c("Block:Plot+Block:Plot:csDay.num!us(2).2:1", "R!variance")
##D    m1.asreml <- setvarianceterms(m1.call, terms, bounds=c("U","P"), 
##D                                  initial=c(NA,3), ignore.suffices=c(FALSE,TRUE))
##D    summary(m1.asreml)
## End(Not run)


