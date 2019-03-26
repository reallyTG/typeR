library(svUnit)


### Name: check
### Title: SciViews R Unit assertions (check functions)
### Aliases: checkEquals checkEqualsNumeric checkIdentical checkTrue
###   checkException DEACTIVATED
### Keywords: utilities

### ** Examples

clearLog()			# Clear the svUnit log

## All these tests are correct
(checkEquals(c("A", "B", "C"), LETTERS[1:3]))
(checkEqualsNumeric(1:10, seq(1, 10)))
(checkIdentical(iris[1:50, ], iris[iris$Species == "setosa",]))
(checkTrue(1 < 2))
(checkException(log("a")))
Log()	# See what's recorded in the log

## ... but these ones fail
(checkEquals("A", LETTERS[1:3]))
(checkEqualsNumeric(2:11, seq(1, 10)))
(checkIdentical(iris[1:49, ], iris[iris$Species == "setosa",]))
(checkTrue(1 > 2))
(checkException(log(1)))
Log()	# See what's recorded in the log

## Create a test function and run it
foo <- function(x, y = 2) return(x * y)
test(foo) <- function () {
    #DEACTIVATED()
    checkEqualsNumeric(5, foo(2))
    checkEqualsNumeric(6, foo(2, 3))
    checkTrue(is.test(foo))
    checkTrue(is.test(test(foo)))
    checkIdentical(test(foo), attr(foo, "test"))
    checkException(foo("b"))
	checkException(foo(2, "a"))
}
(runTest(foo))

## Of course, everything is recorded in the log
Log()

clearLog()



