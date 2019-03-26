library(TexExamRandomizer)


### Name: StructureDocument
### Title: Structure Document
### Aliases: StructureDocument

### ** Examples

file <- system.file(
    "extdata",
    "ExampleTexDocuments",
    "exam_testing_jsonparser.tex",
    package = "TexExamRandomizer"
)
x <- readLines(file)
layersNames <- c("questions", "choices")
layersCmd <- c("question", "(choice|CorrectChoice)")
doc <- StructureDocument(x, layersNames, layersCmd)



