library(Ecfun)


### Name: match.data.frame
### Title: Identify the row of 'y' best matching each row of 'x'
### Aliases: match.data.frame
### Keywords: manip

### ** Examples

newdata <- data.frame(state=c("AL", "MI","NY"),
                      surname=c("Rogers", "Rogers", "Smith"),
                      givenName=c("Mike R.", "Mike K.", "Al"),
                      stringsAsFactors=FALSE)
reference <- data.frame(state=c("NY", "NY", "MI", "AL", "NY", "MI"),
                      surname=c("Smith", "Rogers", "Rogers (MI)",
                                "Rogers (AL)", "Smith", 'Jones'),
                      givenName=c("John", "Mike", "Mike", "Mike",
                                "T. Albert", 'Al Thomas'),
                      stringsAsFactors=FALSE)
newInRef <- match.data.frame(newdata, reference,
       grep.=c(NA, 'agrep', 'agrep'))

## Don't show: 
stopifnot(
## End(Don't show)
all.equal(newInRef, c(4, 3, 5))
## Don't show: 
)
## End(Don't show)



