library(TexExamRandomizer)


### Name: DivideFile
### Title: DivideFile
### Aliases: DivideFile

### ** Examples

file <- system.file(
    "extdata",
    "ExampleTexDocuments",
    "exam_testing_jsonparser.tex",
    package = "TexExamRandomizer"
)
x <- readLines(file)
DivideFile(x)



