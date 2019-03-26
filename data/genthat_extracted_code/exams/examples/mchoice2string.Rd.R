library(exams)


### Name: mchoice2string
### Title: Convenience Functions for Exam Formatting
### Aliases: mchoice2string string2mchoice mchoice2text answerlist
### Keywords: utilities

### ** Examples

## multiple choice answer
mc <- c(TRUE, FALSE, TRUE, FALSE, FALSE)

## switching to string representation
mchoice2string(mc)

## reverse string encoding
string2mchoice("10100")

## switching to text
mchoice2text(mc)

## generating answerlist based on questions,
## solutions and explanations
qu <- c("Zurich is the capital of Switzerland.",
        "Italian is an official language in Switzerland.",
        "Switzerland is part of the European Union.")
sol <- c(FALSE, TRUE, FALSE)
ex <- c("The capital of Switzerland is Bern.",
        "The four official languages are: German, French, Italian, Romansh.",
	"Switzerland is part of the Schengen Area but not the European Union.")
answerlist(qu)
answerlist(ifelse(sol, "True", "False"), ex)



