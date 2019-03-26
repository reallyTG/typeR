library(TexExamRandomizer)


### Name: ObtainExamStats
### Title: Obtaining exam statistics
### Aliases: ObtainExamStats

### ** Examples


asheet_file <-
    system.file(
        "extdata",
        "ExampleTables",
        "ExampleAnswerSheet.csv",
        package = "TexExamRandomizer")
responses_file <-
    system.file(
        "extdata",
        "ExampleTables",
        "ExampleResponses.csv",
        package = "TexExamRandomizer")
FullAnswerSheet <-
    read.csv(
        asheet_file,
        header = TRUE,
        stringsAsFactors = FALSE,
        na.strings = c("", "NA", "Na"),
        strip.white = TRUE)
Responses <- read.csv(
    responses_file,
    header = TRUE,
    stringsAsFactors = FALSE,
    na.strings = c("", "NA", "Na"),
    strip.white = TRUE)
compiledanswers <-
    WhichAnswerOriginal(
        StudentAnswers = Responses,
        FullExamAnswerSheet = FullAnswerSheet,
        names.StudentAnswerQCols = grep(
            names(Responses),
            pattern = "^Q.*[[:digit:]]",
            value = TRUE),
        names.StudentAnswerExamVersion = grep(
            names(Responses),
            pattern = "Version",
            value = TRUE),
        OriginalExamVersion = 0,
        names.FullExamVersion = "Version",
        names.FullExamOriginalCols = grep(
            names(FullAnswerSheet),
            pattern = "_original",
            value = TRUE),
        names.CorrectAndIncorrectCols = c(
            "choice",
            "CorrectChoice")
    )
OriginalAnswerSheet <- FullAnswerSheet[FullAnswerSheet$Version == 0,]
ExamStats <-
    ObtainExamStats(
        OriginalExamAnswerSheet = OriginalAnswerSheet,
        ExamAnswerParsedList = compiledanswers,
        names.FullExamOriginalCols =  grep(
            names(FullAnswerSheet),
            pattern = "_original",
            value = TRUE)
    )



