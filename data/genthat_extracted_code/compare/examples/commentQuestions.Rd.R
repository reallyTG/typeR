library(compare)


### Name: commentQuestions
### Title: Apply a Commenting Scheme
### Aliases: commentQuestions
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
q1comments <- questionComments(c("id", "age", "edu", "class"),
                               comments("class",
                                        transformComment("coerced",
                                                         "'class' is a factor!")))
commentQuestions(results, q1comments)



