library(BayesX)


### Name: getNumbers
### Title: Extract numbers from (BayesX log file) strings
### Aliases: getNumbers
### Keywords: internal

### ** Examples

## create a nice example
sampleStrings <- c("Second: 385",
                   "  First:  70000 ",                   
                   "asdfkf T: 24      ")

## test the function
extractedNumbers <- BayesX:::getNumbers(beforeStringsList=
                                        list(first="First:",
                                             second="Second:",
                                             third="T:"),
                                        stringVector=sampleStrings)

## and assert that the result is as expected
stopifnot(identical(extractedNumbers,
                    list(first=70000, second=385, third=24)))

## specific test
stopifnot(identical(BayesX:::getNumbers(beforeStringsList=
                                        list(Iterations = "Number of iterations:"),
                                        stringVector=
                                        "  Number of iterations: 70000 "),
                    list(Iterations=70000)))



