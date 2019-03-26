library(exams)


### Name: exams2arsnova
### Title: Generation of Exam/Quiz Sessions in ARSnova Format
### Aliases: exams2arsnova make_exams_write_arsnova
### Keywords: utilities

### ** Examples

## load package and enforce par(ask = FALSE)
library("exams")
options(device.ask.default = FALSE)

## Not run: 
##D ## exams2arsnova can either create text files with JSON data
##D exams2arsnova("tstat2")
##D 
##D ## or directly post this to an active ARSnova session (for which the
##D ## server URL, the 8-digit session key, and the JSESSIONID cookie are needed)
##D exams2arsnova("tstat2", url = "https://arsnova.eu/api",
##D   sessionkey = "49061284", jsessionid = "A5BEFDA4141816BB425F2204A602E4B3")
## End(Not run)



