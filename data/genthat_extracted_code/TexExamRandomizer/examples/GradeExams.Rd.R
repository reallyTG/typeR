library(TexExamRandomizer)


### Name: GradeExams
### Title: GradeExams
### Aliases: GradeExams

### ** Examples


#First part coming from FindMatchingRow example

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
# Actual Code


ExtraPoints_individual <- runif(nrow(Responses), min = 1, max = 10)
ExtraPoints_forall <- 2
GradedStudentTable <-
    GradeExams(
        compiledanswers,
        name.ColCorrect = "CorrectChoice",
        name.ColIncorrect = "choice",
        MaxOutputGrade = 100,
        ExtraPoints = ExtraPoints_individual,
        ExtraPointsForAll = ExtraPoints_forall
    )







