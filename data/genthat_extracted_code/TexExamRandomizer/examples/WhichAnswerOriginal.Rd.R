library(TexExamRandomizer)


### Name: WhichAnswerOriginal
### Title: WhichAnswerOriginal
### Aliases: WhichAnswerOriginal

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
nicknames <- attr(compiledanswers, "StudentInfo")$Nickname

for (i in 1:length(compiledanswers)) {
    cat("Student\t", nicknames[i], " got\t",
        sum(!is.na(compiledanswers[[i]]$CorrectChoice)),
        " questions correctly\n", sep = "")
}



