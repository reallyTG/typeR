library(compare)


### Name: markQuestions
### Title: Apply a Marking Scheme
### Aliases: markQuestions
### Keywords: utilities logic

### ** Examples

modelNames <- c("id", "age", 
                "edu", "class", 
                "IndianMothers")
files <- list.files(system.file("example", package="compare"),
                    pattern="^student[0-9]+[.]R$",
                    full.names=TRUE)

results <- compareFiles(files,
                        modelNames,
                        system.file("example", "model.R", package="compare"),
                        allowAll=TRUE,
                        resultNames=gsub(".+[/]|[.]R", "", files))
q1 <- questionMarks(c("id", "age", "edu", "class"),
                    maxMark=2,
                    rule("id", 1),
                    rule("age", 1),
                    rule("edu", 1),
                    rule("class", 1,
                         transformRule("coerced", 1)))

q2 <- questionMarks("IndianMothers",
                    maxMark=1,
                    rule("IndianMothers", 1))

markQuestions(results, q1, q2)



