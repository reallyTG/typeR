library(TexExamRandomizer)


### Name: GenerateShortAnswerSheet
### Title: Generating a short answer sheet
### Aliases: GenerateShortAnswerSheet

### ** Examples


csvfile <- system.file(
    "extdata",
    "ExampleTables",
    "ExampleAnswerSheet.csv",
    package = "TexExamRandomizer"
)
testASheet <- read.csv(
    csvfile,
    header = TRUE,
    stringsAsFactors = FALSE,
    na.strings = c("", "NA", "Na"),
    strip.white = TRUE
)

GenerateShortAnswerSheet(testASheet)



